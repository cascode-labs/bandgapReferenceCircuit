v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
P 4 5 1000 -320 1420 -320 1420 -100 1000 -100 1000 -320 {}
T {Voltages} 1020 -300 0 0 0.4 0.4 {}
N 320 -80 340 -80 {
lab=#net1}
N 320 -120 320 -80 {
lab=#net1}
N 320 -170 340 -170 {
lab=#net1}
N 300 -230 340 -230 {
lab=#net2}
N 300 -60 340 -60 {
lab=#net2}
N 300 -230 300 -60 {
lab=#net2}
N 280 -120 320 -120 {
lab=#net1}
N 320 -170 320 -120 {
lab=#net1}
N 680 -250 680 -240 {
lab=VDD}
N 680 -340 770 -340 {
lab=VDD}
N 770 -250 770 -240 {
lab=VDD}
N 770 -170 790 -170 {
lab=GND}
N 770 -170 770 -140 {
lab=GND}
N 770 -140 790 -140 {
lab=GND}
N 790 -140 790 -120 {
lab=GND}
N 790 -260 790 -200 {
lab=#net3}
N 590 -200 790 -200 {
lab=#net3}
N 790 -340 790 -320 {
lab=VDD}
N 770 -340 790 -340 {
lab=VDD}
N 790 -340 900 -340 {
lab=VDD}
N 900 -340 900 -230 {
lab=VDD}
N 790 -200 860 -200 {
lab=#net3}
N 900 -200 910 -200 {
lab=VDD}
N 910 -230 910 -200 {
lab=VDD}
N 900 -230 910 -230 {
lab=VDD}
N 740 -250 740 -240 {
lab=VDD}
N 740 -250 770 -250 {
lab=VDD}
N 770 -340 770 -250 {
lab=VDD}
N 650 -250 650 -240 {
lab=VDD}
N 650 -250 680 -250 {
lab=VDD}
N 680 -340 680 -250 {
lab=VDD}
N 620 -280 620 -240 {
lab=#net4}
N 500 -280 620 -280 {
lab=#net4}
N 300 -280 440 -280 {
lab=#net2}
N 300 -280 300 -230 {
lab=#net2}
N 500 -320 710 -320 {
lab=#net5}
N 280 -320 440 -320 {
lab=#net1}
N 900 -170 900 -140 {
lab=#net6}
N 710 -320 710 -240 {
lab=#net5}
N 280 -320 280 -120 {
lab=#net1}
N 640 -80 900 -80 {
lab=#net7}
C {devices/vsource.sym} 1030 -200 0 0 {name=V1 net_name=true value="'VDD' pwl 0us 0 5us 'VDD'"}
C {devices/vdd.sym} 1030 -230 0 0 {name=l8 lab=VDD}
C {devices/gnd.sym} 1030 -170 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} 1210 -200 0 0 {name=V2 net_name=true value="0 pulse(0V 1.8V 10us 0us 0us 5us)"}
C {devices/gnd.sym} 1210 -170 0 0 {name=l16 lab=GND}
C {devices/lab_pin.sym} 1210 -230 0 0 {name=l19 lab=pin}
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
C {devices/vdd.sym} 770 -340 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 790 -120 0 0 {name=l2 lab=GND}
C {devices/capa.sym} 790 -290 0 0 {name=C1
m=1
value=20p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 830 -170 2 0 {name=l4 lab=pin}
C {devices/ammeter.sym} 470 -280 1 0 {name=Vm1 current=1.0057e-05}
C {devices/ammeter.sym} 470 -320 1 0 {name=Vm2 current=1.0057e-05}
C {devices/ammeter.sym} 900 -110 0 0 {name=Vm3 current=1.0057e-05}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 650 -220 3 0 {name=M1
L=2
W=1
nf=1
mult=386.6
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 740 -220 3 0 {name=M2
L=2
W=1
nf=1
mult=386.6
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 880 -200 0 0 {name=M3
L=2
W=1
nf=1
mult=386.6
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 810 -170 2 0 {name=M10
L='2'
W='1'
nf=1
mult=34
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {/home/thomas/Projects/bandgapReferenceCircuit/bandgap_sky130_v1/cascode_amplifier_with_bias-ckt.sym} 440 -200 0 0 {name=x1}
C {/home/thomas/Projects/bandgapReferenceCircuit/bandgap_sky130_v1/cascode_bandgapCore.sym} 490 -70 0 0 {name=x2}
