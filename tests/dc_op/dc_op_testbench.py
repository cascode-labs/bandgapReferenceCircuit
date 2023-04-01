import hdl21 as h
from hdl21.sim import *

bandgap = h.ExternalModule(
    name="bandgap_01",
    desc="The bandgap DUT",
    domain="xschem schematic",
    port_list=[h.Inout(name="PLUS"), h.Inout(name="MINUS")],
    paramtype=PdkResistorParams,
    schematic_path=Path()
)

@h.module
class MyModulesTestbench:
    # ... Testbench content ...

# Create simulation input
s = Sim(
    tb=MyModulesTestbench,
    attrs=[
        Dc(name="dcop"),
        
        Save(SaveMode.ALL),
        Meas(analysis="mytr", name="a_delay", expr="trig_targ_something"),
        Include("/home/models"),
        Lib(path="/home/models", section="fast"),
        Options(reltol=1e-9),
    ],
)

# And run it!
sim.run()