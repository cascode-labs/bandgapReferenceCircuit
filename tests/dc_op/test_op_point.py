import pytest
from pathlib import Path
from xschem_testbench import xschem_testbench, ngspice_result



@pytest.fixture(scope="session")
def dcop_result() -> ngspice_result:
    tb = xschem_testbench("dc_op", "/workspaces/bandgapReferenceCircuit/tests/dc_op/tsmc_bandgap_real_op.sch")
    result = tb.run()
    result.print_summary()
    return result

def test_vdsat(dcop_result: ngspice_result):
    assert isinstance(dcop_result, ngspice_result)
