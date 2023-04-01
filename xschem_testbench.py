import subprocess, os
from pathlib import Path
from typing import Union, Optional
from ngspice_result import ngspice_result

optional_path = Optional[Union[Path, str]]


class xschem_testbench:
    #default_root_result_path = Path.home() / "sim_results"
    xschemrc_path = Path("/foss/pdks/sky130A/libs.tech/xschem/xschemrc")
    def __init__(self, name: str, schematic_path: Union[Path, str],tb_path: Union[Path, str],
                 result_path: optional_path = None) -> None:
        self.name = name
        self.schematic_path = Path(schematic_path)
        self.tb_path = Path(tb_path)
        if result_path is not None:
            self.result_path = Path(result_path)
        else:
            #self.result_path = self.default_root_result_path / self.name
            self.result_path = self.tb_path
        netlist_filename = self.schematic_path.stem + ".spice"
        self.netlist_path = self.result_path / "netlist" / netlist_filename
        self.netlist_log_path = self.netlist_path.parent / ".netlisting.log"
        soa_log_filename = self.tb_path.stem + ".soa.log"
        self.soa_log_path = self.tb_path / soa_log_filename
        sim_log_filename = self.tb_path.stem + ".sim.log"
        self.sim_log_path = self.result_path / sim_log_filename
    
    def netlist(self):
        """netlist an xschem schematic."""
        print(f"netlisting {str(self.tb_path)}\n to {self.netlist_path}")
        #self.netlist_path.parent.rmdir()
        self.netlist_path.parent.mkdir(parents=True,exist_ok=True)
        sch_picture_path = self.netlist_path.parent / \
                           (self.tb_path.stem + ".svg")
        run_result=subprocess.run(["xschem", "-q",
                        "-n", "-o", str(self.netlist_path.parent),
                        "--svg", "--plotfile", str(sch_picture_path),
                        "-l", str(self.netlist_log_path),
                        "--rcfile", str(self.xschemrc_path),
                        str(self.schematic_path)], 
                       capture_output=True, check=True)
        # if len(run_result.stdout) > 0:
        #     print(run_result.stdout)
        #     

        #os.system(f'xschem -q'
        #          f' -n {self.netlist_path}'
        #          f' {self.schematic_path}')

    def simulate(self) -> ngspice_result:
        """Simulate using ngspice"""
        if not self.netlist_path.is_file():
            raise RuntimeError("Testbench netlist does not exist.")
        print(f'Simulating {self.netlist_path.name} at \n'
              f'  {self.netlist_path}')
        raw_output_path = f'{self.result_path/self.name}.raw'
        output_path = f'{self.result_path/self.name}.out'
        run_result=subprocess.run(
            ["ngspice", "-b",
             "-o", str(output_path),
             "-r", raw_output_path,
             f'--soa-log={self.soa_log_path}',
             str(self.netlist_path),
            ],
            capture_output=True, check=True)
        with open(self.sim_log_path,mode="w") as log:
                 log.write(str(run_result.stdout))
        return ngspice_result(self, output_path, raw_output_path)

    def run_schematic(self) -> ngspice_result:
        self.netlist()
        return self.simulate()
    
    @classmethod
    def run(cls, name: str, schematic_path: Union[Path, str],tb_path: Union[Path, str]):
        "Netlists and then simulates a schematic"
        tb = cls(name, schematic_path, tb_path)
        result = tb.run_schematic()
        result.print_summary()
