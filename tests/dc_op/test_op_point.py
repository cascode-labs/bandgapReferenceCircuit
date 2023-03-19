import pytest
from pathlib import Path
#from xschem_testbench import xschem_testbench, ngspice_result
from spyci import spyci
from rawread import rawread



@pytest.fixture(scope="session")
def dcop_result() -> Path:
    return Path("/workspaces/bandgapReferenceCircuit/tests/dc_op/simulation/tsmc_bandgap_real_op.raw")
    # tb = xschem_testbench("dc_op", "/workspaces/bandgapReferenceCircuit/tests/dc_op/tsmc_bandgap_real_op.sch")
    # result = tb.run()
    # result.print_summary()
    # return result

def test_vdsat(dcop_result):
    # data = spyci.load_raw(str(dcop_result))
    data = rawread(str(dcop_result))
    #assert isinstance(dcop_result, ngspice_result)

if __name__ == "__main__":
    test_vdsat(Path("/workspaces/bandgapReferenceCircuit/tests/dc_op/simulation/tsmc_bandgap_real_op.raw"))