v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
P 4 5 690 -320 1110 -320 1110 -100 690 -100 690 -320 {}
T {Voltages} 710 -300 0 0 0.4 0.4 {}
N 350 -290 460 -290 {
lab=#net1}
N 440 -150 480 -150 {
lab=#net2}
N 310 -150 310 -100 {
lab=#net3}
N 310 -100 480 -100 {
lab=#net3}
N 290 -170 310 -170 {
lab=#net4}
N 290 -170 290 -40 {
lab=#net4}
N 290 -40 480 -40 {
lab=#net4}
N 540 -150 610 -150 {
lab=#net5}
N 610 -260 610 -150 {
lab=#net5}
N 610 -280 630 -280 {
lab=#net6}
N 630 -280 630 -100 {
lab=#net6}
N 540 -100 630 -100 {
lab=#net6}
N 540 -40 650 -40 {
lab=#net7}
N 650 -300 650 -40 {
lab=#net7}
N 610 -300 650 -300 {
lab=#net7}
N 210 -170 290 -170 {
lab=#net4}
N 210 -270 210 -170 {
lab=#net4}
N 190 -150 310 -150 {
lab=#net3}
N 190 -310 190 -150 {
lab=#net3}
N 190 -310 210 -310 {
lab=#net3}
N 310 -100 310 -70 {
lab=#net3}
N 370 -70 420 -70 {
lab=GND}
N 280 -220 540 -220 {
lab=GND}
N 280 -250 280 -220 {
lab=GND}
N 410 -220 410 -210 {
lab=GND}
N 280 -350 280 -330 {
lab=VDD}
N 280 -350 540 -350 {
lab=VDD}
N 540 -350 540 -340 {
lab=VDD}
N 420 -390 420 -350 {
lab=VDD}
N 440 -170 480 -170 {
lab=GND}
N 480 -220 480 -170 {
lab=GND}
C {devices/vsource.sym} 720 -200 0 0 {name=V1 net_name=true value="'VDD' pwl 0us 0 5us 'VDD'"}
C {devices/vdd.sym} 720 -230 0 0 {name=l8 lab=VDD}
C {devices/gnd.sym} 720 -170 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} 900 -200 0 0 {name=V2 net_name=true value="0 pulse(0V 1.8V 10us 0us 0us 5us)"}
C {devices/gnd.sym} 900 -170 0 0 {name=l16 lab=GND}
C {devices/lab_pin.sym} 900 -230 0 0 {name=l19 lab=pin}
C {devices/code.sym} 40 -320 0 0 {name=NGSPICE1
only_toplevel=true
spice_ignore=true
value=".option seed=13

* this experimental option enables mos model bin 
* selection based on W/NF instead of W
.param ABSVAR=0.03
.param VDDGAUSS=agauss(1.8, 'ABSVAR', 1)
.param VDD=VCCGAUSS
** variation parameters:
.param sky130_fd_pr__nfet_01v8_lvt__vth0_slope_spectre='agauss(0, ABSVAR, 3)/sky130_fd_pr__nfet_01v8_lvt__vth0_slope'
.param sky130_fd_pr__pfet_01v8_lvt__vth0_slope_spectre='agauss(0, ABSVAR, 3)/sky130_fd_pr__pfet_01v8_lvt__vth0_slope'
.param sky130_fd_pr__nfet_01v8__vth0_slope_spectre='agauss(0, ABSVAR, 3)/sky130_fd_pr__nfet_01v8__vth0_slope'
.param sky130_fd_pr__pfet_01v8__vth0_slope_spectre='agauss(0, ABSVAR, 3)/sky130_fd_pr__pfet_01v8__vth0_slope'

.param sky130_fd_pr__pfet_01v8__toxe_slope_spectre='agauss(0, ABSVAR*2, 3)/sky130_fd_pr__pfet_01v8__toxe_slope'
.param sky130_fd_pr__nfet_01v8__toxe_slope_spectre='agauss(0, ABSVAR*2, 3)/sky130_fd_pr__nfet_01v8__toxe_slope'
.param sky130_fd_pr__pfet_01v8_lvt__toxe_slope_spectre='agauss(0, ABSVAR*2, 3)/sky130_fd_pr__pfet_01v8_lvt__toxe_slope'
.param sky130_fd_pr__nfet_01v8_lvt__toxe_slope_spectre='agauss(0, ABSVAR*2, 3)/sky130_fd_pr__nfet_01v8_lvt__toxe_slope'

.param sky130_fd_pr__res_high_po__var_mult=agauss(0, 'ABSVAR*8', 1)

* .options savecurrents
.control
  let run=1
  dowhile run <= 40
    if run > 1
      reset
      set appendwrite
    end
    save all
    if run % 3 = 0
      set temp=0
    end
    if run % 3 = 1
      set temp=27
    end
    if run % 3 = 2
      set temp=70
    end
    tran 0.05u 150u
    write tsmc_bandgap_real_variation.raw
    let run = run + 1
  end
  set nolegend
  plot all.vbg
.endc
" }
C {devices/code.sym} 40 -160 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {devices/ammeter.sym} 510 -40 1 0 {name=Vm1 current=1.0057e-05}
C {devices/ammeter.sym} 510 -100 1 0 {name=Vm2 current=1.0057e-05}
C {/home/thomas/Projects/HW-Design/ieee_comps/bandgapReferenceCircuit/bandgap_sky130_v1/cascode_amplifier_with_bias-ckt.sym} 290 -290 0 0 {name=x1}
C {devices/ammeter.sym} 510 -150 1 0 {name=Vm3 current=1.0057e-05}
C {/home/thomas/Projects/HW-Design/ieee_comps/bandgapReferenceCircuit/bandgap_sky130_v1/current_3_mirror-ckt.sym} 530 -280 0 0 {name=x3}
C {devices/lab_pin.sym} 460 -270 0 0 {name=l1 lab=pin}
C {devices/gnd.sym} 410 -210 0 0 {name=l3 lab=GND}
C {devices/capa.sym} 340 -70 3 0 {name=C1
m=1
value=20p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 420 -70 3 0 {name=l2 lab=GND}
C {devices/vdd.sym} 420 -390 0 0 {name=l4 lab=VDD}
C {/home/thomas/Projects/HW-Design/ieee_comps/bandgapReferenceCircuit/bandgap_sky130_v1/cascode_bandgapCore.sym} 370 -160 2 1 {name=x2}
