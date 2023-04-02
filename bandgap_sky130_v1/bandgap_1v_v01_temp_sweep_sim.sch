v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {devices/code_shown.sym} 20 50 0 0 {name="Temp Sweep"
only_toplevel=true
spice_ignore=true
value="
.option savecurrents
.option warn=1
.param R3val='800k'
.param alpha='1'
.param R2R3ratio='5.8366561*alpha'
.param R2val='R3val*R2R3ratio' 
.param R4R2ratio=0.47810041
.param R4val='R2val*R4R2ratio'
.control
save all
+ @m.xm13.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm3.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm4.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm5.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm6.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm7.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm8.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm9.msky130_fd_pr__nfet_01v8_lvt[gm]
dc temp -40 140 1
plot Vbg
plot deriv(Vbg)
let i = vm3#branch
let indx = 67
*indx is the index of temperature sweep for 27degC
echo 'Vbg @ 27degC'
let vbg27c = vbg[indx]
print vbg27c
echo 'dVbe/degC & ppm @ 27degC'
print deriv(vbg)[indx] deriv(vbg)[indx]/vbg27c
echo 'ppm real'
print (vbg[110]-vbg[40])/vbg[67]/(70-0)*1e6
plot deriv(vbg)/vbg27c
plot v(va, vb) vs i
plot vm1#branch vm2#branch vm3#branch
let vsg = vdd - vgate
let vsd1 = vdd - va
let vsd2 = vdd - vb
let vsd3 = vdd - vbg
let vthp = @m.xm1.msky130_fd_pr__pfet_01v8_lvt['vth']
let vov = vsg - vthp
plot vov vsd1 vsd2 vsd3
let deltav = vb - vbneg
let r4 =vbg/vm3#branch
let r1 =va/vr1#branch
let r2 =vb/vr4#branch
let r3 =deltav/vr2#branch
let vptat =(r2/r3*deltav)
let sum = veb+vptat
plot veb vptat sum
plot deriv(veb) deriv(vptat)
let TCratio=deriv(veb)/deriv(vptat)
plot TCratio
plot vb - va
echo 'alpha correction factor'
let alpha=TCratio[indx]
print alpha
let gm1=@m.xm1.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm2=@m.xm2.msky130_fd_pr__pfet_01v8_lvt[gm]
let Av2=gm2 * ((r3 + r3/ln(39)) * r2 / (r3 + r3/ln(39) + r2) )
let Av1=gm1 * (r1 * r3/ln(39))/(r1 + r3/ln(39))
plot Av1 Av2 Av2/Av1
let gm13=@m.xm13.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm3=@m.xm3.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm4=@m.xm4.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm5=@m.xm5.msky130_fd_pr__nfet_01v8_lvt[gm]
let gm6=@m.xm6.msky130_fd_pr__nfet_01v8_lvt[gm]
let gm7=@m.xm7.msky130_fd_pr__nfet_01v8_lvt[gm]
let gm8=@m.xm8.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm9=@m.xm9.msky130_fd_pr__nfet_01v8_lvt[gm]
let vdsat1=2/(gm1/vm1#branch)
let vdsat2=2/(gm2/vm2#branch)
let vdsat3=2/(gm3/vm3#branch)
let vdsat4=2/(gm4/@m.xm4.msky130_fd_pr__pfet_01v8_lvt[id])
let vdsat5=2/(gm5/@m.xm5.msky130_fd_pr__nfet_01v8_lvt[id])
let vdsat6=2/(gm6/@m.xm6.msky130_fd_pr__nfet_01v8_lvt[id])
let vdsat7=2/(gm7/@m.xm7.msky130_fd_pr__nfet_01v8_lvt[id])
let vdsat8=2/(gm8/@m.xm8.msky130_fd_pr__pfet_01v8_lvt[id])
let vdsat9=2/(gm9/@m.xm9.msky130_fd_pr__nfet_01v8_lvt[id])
let vdsat13=2/(gm13/@m.xm13.msky130_fd_pr__pfet_01v8_lvt[id])
plot (vdd-va-vdsat1) (vdd-vb-vdsat2) (vdd-vbg-vdsat3)
+ (vdd-vgate-vdsat4) (vgate-vq-vdsat5) (vq-0-vdsat6)
+ (vx-0-vdsat7) (vdd-vg-vdsat8) (vg-vq-vdsat9) (vdd-vx-vdsat13)
tran 0.1us 600us
plot vbg vdd 
plot vgate va vb 
plot vx vq vinv
reset
save all
+ @m.xm13.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm3.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm4.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm5.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm6.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm7.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm8.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm9.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm1.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm2.msky130_fd_pr__pfet_01v8_lvt[gm]

op
write tsmc_bandgap_real.raw
.endc
" }
C {devices/gnd.sym} 260 -180 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 330 -230 0 1 {name=l3 lab=vbg}
C {devices/lab_pin.sym} 200 -230 0 0 {name=l15 lab=porst}
C {devices/vdd.sym} 260 -260 0 0 {name=l2 lab=VDD}
C {bandgap_1v_v01.sym} 260 -220 0 0 {name=x1}
C {devices/code.sym} -310 90 0 0 {name=NGSPICE1
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
C {devices/code.sym} -170 90 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {devices/launcher.sym} -230 390 0 0 {name=h1
descr=Annotate 
tclcommand="ngspice::annotate"}
C {devices/launcher.sym} -230 350 0 0 {name=h2
descr="View Raw file" 
tclcommand="textwindow $netlist_dir/[file tail [file rootname [ xschem get schname 0 ] ] ].raw"
}
C {devices/launcher.sym} -230 280 0 0 {name=h3
descr=Backannotate 
tclcommand="xschem annotate_op"}
C {devices/vsource.sym} -240 -210 0 0 {name=V1 net_name=true value="'VDD' pwl 0us 0 5us 'VDD'"}
C {devices/vdd.sym} -240 -240 0 0 {name=l8 lab=VDD}
C {devices/gnd.sym} -240 -180 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} -240 -70 0 0 {name=V2 net_name=true value="0 pulse(0V 1.8V 10us 0us 0us 5us)"}
C {devices/gnd.sym} -240 -40 0 0 {name=l16 lab=GND}
C {devices/lab_pin.sym} -240 -100 0 0 {name=l19 lab=porst}
