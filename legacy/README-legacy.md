# stanford ee272b project - bandgap voltage reference in SKY130 technology
IEEE Solid State Circuits Society Code-a-Chip Jupyter Notebook is located [here](https://github.com/johnkustin/bandgapReferenceCircuit/blob/main/jupyter/notebook.ipynb), at `bandgapReferenceCircuit/jupyter/notebook.ipynb`

2020-2021 Spring

## table of contents
1. single sample silicon measurements 
2. table: design goals vs. post-layout, extracted circuit performance 
3. ngspice simulation: temperature coefficient vs. corners and output voltage monte carlo
4. layout pictures
5. transient on/off switch power
6. what's a bandgap circuit?
7. how's the bandgap circuit work?
8. prerequisites for this repo
9. steps to set up the repository
10. design files <- look here to get the lvs-passing final schematic file
11. running all tests
12. test descriptions
13. viewing results
14. viewing unscripted results




# single sample silicon measurements 
![meas setup](slides/bgrslides.004.jpeg)  
measurement setup  
![tec closeup](slides/bgrslides.005.jpeg)  
close up of the thermoelectric cooler  
![wiring diag](slides/bgrslides.006.jpeg)  
wiring diagram for the test setup  
![vref vs load vs temp](slides/bgrslides.007.jpeg)  
Output reference voltage vs. load and temperature  
![vref vs load](slides/bgrslides.008.jpeg)  
Output reference voltage vs. load for fixed temperature  
![vref vs vdd](slides/bgrslides.009.jpeg)  
Output reference voltage vs. VDD  
![psrr](slides/bgrslides.010.jpeg)  
Power supply rejection ratio of output reference voltage at one frequency  

⚠️**Important disclaimer:** As you can see, there is a large discrepancy between the measured temperature coefficient and the one obtained from simulation. My guess as to why they are different is a difference between the BJT models and what was fabricated. This is only a guess now because I haven't done any investigation and I could only measure one sample. Either I or someone else needs to tweak the BJT size parameters in the schematic and investigate in simulation if the change of BJT parameters can induce a temperature coefficient that is on the same order as what was measured. In other words, there is more work to be done for this project and repository :), but read on with this disclaimer in mind.

# table: design goals vs. post-layout, extracted circuit performance 
# VDD = 1.8 V, TT corner, no mismatch
![results](plots/readme/ee272b-end-quarter-presentation-5.png)  


# ngspice simulations: temperature coefficient vs. corners and output voltage monte carlo
# temperature coefficient 
## `ppm.py`
![result of running `ppm.py`, which processes the output of the transient test, tt](plots/readme/ee272b-end-quarter-presentation-12.png) 

![result of running `ppm.py`, which processes the output of the transient test, ss](plots/readme/ee272b-end-quarter-presentation-13.png) 

![result of running `ppm.py`, which processes the output of the transient test, ff](plots/readme/ee272b-end-quarter-presentation-14.png) 

# output voltage monte carlo
## `variation.py`
![result of running `variation.py`, Monte Carlo mismatch, 0degC](plots/readme/ee272b-end-quarter-presentation-9.png)

![result of running `variation.py`, Monte Carlo mismatch, 27degC](plots/readme/ee272b-end-quarter-presentation-10.png)  

![result of running `variation.py`, Monte Carlo mismatch, 70degC](plots/readme/ee272b-end-quarter-presentation-11.png)  

`0 <= Temperature <= 70`  

# layout pictures
![layout1](plots/readme/ee272b-end-quarter-presentation-6.png)  

![layout2](plots/readme/ee272b-end-quarter-presentation-7.png)  

![layout3](plots/readme/ee272b-end-quarter-presentation-8.png)  

# transient on/off switch power
![wakeup](plots/readme/ee272b-end-quarter-presentation-15.png) 

# what's a bandgap circuit?
a circuit which provides a voltage that's (ideally) independent of temperature. the final circuit in this repository is shown below.
![a screenshot of the circuit in this repository](plots/readme/finalschm.png)
# how's the bandgap circuit work?
A bandgap circuit consists of the following blocks  

![an image from Gray and Meyer's *Analysis and Design of Analog Integrated Circuits* show a hypothetical bandgap reference circuit](schematics/graymeyerfigure.png)  

a bipolar junction transistor (BJT) given some current, will produce a voltage between its base and emitter. This voltage is dependent on temperature and that dependence is *typically* around -2mV/degC. Notice that the dependence is negative (the negative dependence is usually called "complementary" to absolute temperature, or CTAT). the Vt generator is *typically* produced by taking the difference in base-emitter voltages between a pair of BJTs with **different current densities**, which is achieved by either supplying the BJTs with different currents, or by making the area of one BJT larger than the other. The temperature dependence of this difference, i.e. the output of the Vt generator, is *typically* +0.085mV/degC, **much** smaller than the CTAT voltage's dependence. Because this Vt dependence is positive, it's often reffered to as a proportional to absolute temperature (PTAT) voltage. The PTAT voltage is scaled (by *M* in the figure) such that when the CTAT and PTAT voltages are added, the resulting temperature dependence is zero, since the positive and negative temperature dependencies cancel out.  

this circuit has its nuances  
![an annotated screenshot of the circuit in this repository](schematics/annotated-schematic.png)  
the bandgap reference core generates both the CTAT and PTAT voltages. assuming Va=Vb, the currents in R1 and R2 will be the same and they will correspond to the CTAT voltage Veb (since V=IR). The generated Vt appears across R3, so the current through R3 corresponds to the PTAT voltage. These PTAT and CTAT currents are summmed at node Vb and mirrored to the output, where that current generates the reference voltage across R4.  
the amplifier works to keep Va=Vb so that the above process can happen (we assumed Va=Vb). the self-bias circuit supplies the amplifier with a bias current.  
the startup circuit helps the circuit find its stable operating point after the circuit is powerd on.  
the current mirror mirrors current!  

# prerequisites for this repo
ngspice, skywater-pdk, Xschem_sky130, and Xschem. if you're missing one of these, please follow the steps in [this video](https://xschem.sourceforge.io/stefan/xschem_man/video_tutorials/install_xschem_sky130_and_ngspice.mp4). the written documentation for Xschem is available [here](http://repo.hu/projects/xschem/xschem_man/xschem_man.html).  

**note:** Xschem_sky130 is different from the skywater-pdk but is **entirely necessary.** make sure you have it installed.  

# Legacy steps to set up the repository
1. enter bash and source `caddy.bashrc` 
2. in `project-paths.json` fill in the **absolute paths** for each of the entries. my paths are left in that file as an example.  
3. `python edit-xschemrc-paths.py`  
4. `xschem &`. see if xschem opens without error. **important:** please launch xschem from this top directory. `xschemrc` must be in the current working directory, i.e. only launch `xschem` from the root of this repository.  
5. `File -> Open -> /path/to/repo/schematics/tsmc_bandgap_real.sch`  
hopefully, you can now see the full bandgap circuit schematic. try generating a netlist from this schematic; click `netlist` in the top right corner. to verify this worked, click the `simulation` tab in the top toolbar and then click `edit netlist`. a nano editor window should pop up, showing the various circuit components in the netlist.

# design files
the bandgap circuit is compact and the entire design schematic is contained in the following file  
`schematics/tsmc_bandgap_real.sch`  
**note:** you will need xscheme to open the above! if you just want to run the tests for this design, see the next section.

# running all tests
first, each `.spice` file must be generated through `xschem`. all tests are listed in `tests.json`.
1. `xschem &`
2. one by one, open the schematics in table below
3. click `Netlist` in the top right corner of the screen
4. repeat steps 2,3 for all tests
5. in `sims/` you should see the different tests in their `.spice` format
6. `python run-tests.py`
7. all of the tests will run. to view the relevant results, follow the steps of "viewing results"


# test descriptions
| test | description | path to relevant schematic |
| ---- | ----------- | -------------------------- |
| operating point | this simulation solves for a dc operating point for the circuit at 27 degrees celcius. the operating point represents the dc behavior in steady state | `schematics/tsmc_bandgap_real_op.sch` |
| transient | this simulation is a time based simulation; the supply, VDD, is ramped up over 5 microseconds. a power on reset pulse is then applied. the circuit then settles into a desired operating point. this simulation performs the test at three temperatures: 0, 27, 70 degrees celcius. | `schematics/tsmc_bandgap_real_tran.sch` |
| transient, with VDD and some process variation | this test varies the following quantities: VDD, threshold voltage (Vth), gate oxide thickness (tox), offset voltage in the subthreshold region, subthreshold swing, ideal max forward beta, transport saturation current, and transport saturation curent's temperature effect exponent. each variation is according to a normally distributed Gaussian distribution. | `schematics/tsmc_bandgap_real_tran_gauss.sch` |
| temperature sweep | this simulation solves for an initial operating point at temp = 0 degC and then does an incremental Newton Raphson to solve for the opearting points at successive temperatures. | `schematics/tsmc_bandgap_real.sch` |

# running an individual test
as an example, the following commands simulates only one SPICE netlist:  
`ngspice -b -r ./sim/test-name-here.raw -o ./sim/test-name-here.out ./sim/test-name-here.spice`

# viewing results
There is a script to interpret the `ngspice` data generated from each test, i.e. to get the most salient information you can run these scripts  

| script | description | path to relevant script |
| ------ | ----------- | ----------------------- |
| `vdsat.py` | this script will read from the operating point simulation all of the vdsats and the vdsat margins. all margins should be positive to ensure the transistors can be in saturation. | `simulation_post_processing/vdsats.py` |
| `ppm.py` | this script will read from the transient simulation (no variation) to plot the start up of the circuit at 0, 27, and 70 degrees celsius. the script will also print out the ppm of the circuit. | `simulation_post_processing/ppm.py` |
| `variations.py` | this script will read from the transient simulation with variations to plot many startups of the circuit at 0, 27, and 70 degrees celsius. the script will also print out the mean and standard deviation of the resulting reference voltage | `simulation_post_processing/variations.py` |
| `tempsweep.py` | this script will read from the DC temperature sweep simulation to plot the voltage reference value over temperature. the script will also print out a ppm value according to the DC sweep. | `simulation_post_processing/tempsweep.py` |

# viewing unscripted results
a printout of relevant operating point voltages is available at `sims/tsmc_bandgap_real_op.out`.  

# running your own simulations
if you want to play with simulations yourself, use `schematics/tsmc_bandgap_real.sch` as your sandbox. the difference between this schematic and the schematics in the test descriptions table is that the schematics in the table have specific simulation commands attached to them. `schematics/tsmc_bandgap_real.sch` has many ngspice commands in the schematic, **which are enabled and disabled by the "spice_ignore" variable in the command listing.** if you want a set of simulation commands to be ignore, set `spice_ignore = True`, but if you want to use a set of simulation commands, set `spice_ignore = False`.
