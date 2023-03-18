import subprocess, os
from pathlib import Path
from typing import Union, Optional

optional_path = Optional[Union[Path, str]]


class ngspice_result:
    def __init__(self, test_bench: "xschem_testbench", 
                 output_path: Path, raw_output_path: Path) -> None:
        self.test_bench = test_bench
        self.path = test_bench.result_path
        self.output_path = output_path
        self.raw_output_path = raw_output_path
    
    def print_summary(self):
        print(f'{self.test_bench} Test Bench')
        print(f'  path: {self.path}')
        print(f'  output: {self.output_path}')
        print(f'  raw output: {self.raw_output_path}')


class xschem_testbench:
    #default_root_result_path = Path.home() / "sim_results"
    xschemrc_path = Path("/foss/pdks/sky130A/libs.tech/xschem/xschemrc")
    def __init__(self, name: str, schematic_path: Union[Path, str],
                 result_path: optional_path = None) -> None:
        self.name = name
        self.schematic_path = Path(schematic_path)
        if result_path is not None:
            self.result_path = Path(result_path)
        else:
            #self.result_path = self.default_root_result_path / self.name
            self.result_path = self.schematic_path.parent
        netlist_filename = self.schematic_path.stem +".spice"
        self.netlist_path = self.result_path / "netlist" / netlist_filename
        self.log_path = self.netlist_path.parent / "netlisting.log"

    def netlist(self):
        """netlist an xschem schematic."""
        print(f"netlisting {str(self.schematic_path)}\n to {self.netlist_path}")
        self.netlist_path.parent.mkdir(parents=True,exist_ok=True)
        run_result=subprocess.run(["xschem", "-q", 
                        "-n", "-o", str(self.netlist_path.parent),
                        "-l", str(self.log_path),
                        "--rcfile", str(self.xschemrc_path),
                        str(self.schematic_path)], 
                       capture_output=True, check=True)
        # if len(run_result.stdout) > 0:
        #     print(run_result.stdout)
        #     with open(self.log_path) as log:
        #         log.writ(run_result.stdout)

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
        os.system(f'ngspice -b'
                  f' -o {output_path}'
                  f' -r {raw_output_path}'
                  f' {self.netlist_path}')
        return ngspice_result(self, output_path, raw_output_path)

    def run_schematic(self) -> ngspice_result:
        self.netlist()
        return self.simulate()
    
    @classmethod
    def run(cls, name: str, schematic_path: Union[Path, str]):
        "Netlists and then simulates a schematic"
        tb = cls(name, schematic_path)
        result = tb.run_schematic()
        result.print_summary()
