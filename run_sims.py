from pathlib import Path
from xschem_testbench import xschem_testbench

if __name__ == "__main__":
    tests_dir = Path("/workspaces/bandgapReferenceCircuit/tests/")
    tests = [
        ["dc_op", "tsmc_bandgap_real_op_layout.sch"],
        #["tran",  "tsmc_bandgap_real_tran.sch"],
        #["tran_gauss", "tsmc_bandgap_real_tran_gauss.sch"], # MonteCarlo
        #["tempsweep", "tsmc_bandgap_real_tempsweep.sch"],
    ]
    for test in tests:
        xschem_testbench.run(test[0], tests_dir / test[0] / test[1])

    