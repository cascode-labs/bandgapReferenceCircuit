v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 710 -460 710 -420 {
lab=porst}
N 500 -550 770 -550 {
lab=VDD}
N 770 -550 770 -520 {
lab=VDD}
N 710 -420 710 -400 {
lab=porst}
C {devices/vsource.sym} 500 -520 0 0 {name=V1 net_name=true value="'VDD' pwl 0us 0 5us 'VDD'"}
C {devices/vdd.sym} 500 -550 0 0 {name=l8 lab=VDD}
C {devices/gnd.sym} 500 -490 0 0 {name=l9 lab=GND}
C {devices/gnd.sym} 770 -410 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 830 -460 0 1 {name=l3 lab=vbg}
C {devices/code_shown.sym} 1400 -490 0 0 {name=s1 
only_toplevel=true 
spice_ignore=true

value="
.option savecurrents
.param R3val='22.187k'
.param alpha='1'
.param R2R3ratio='5.6555038*alpha'
.param R2val='R3val*R2R3ratio'
.param R4R2ratio='0.79694273'
.param R4val='R2val*R4R2ratio
.nodeset v(vgate)=1.4

.control
save all
+ @m.xm1.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm2.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm3.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm4.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm5.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm6.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm7.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm8.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm9.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm13.msky130_fd_pr__pfet_01v8_lvt[gm]

op
write tsmc_bandgap_real.raw
let id8=@m.xm8.msky130_fd_pr__pfet_01v8_lvt[id]
let id1=@m.xm1.msky130_fd_pr__pfet_01v8_lvt[id]
let vth5=@m.xm5.msky130_fd_pr__nfet_01v8_lvt[vth]
let vth6=@m.xm6.msky130_fd_pr__nfet_01v8_lvt[vth]
let wm8=@m.xm8.msky130_fd_pr__pfet_01v8_lvt[w]
let mm8=@m.xm8.msky130_fd_pr__pfet_01v8_lvt[m]
let weff8=wm8*mm8
let jd8=id8/weff8
let wm1=@m.xm1.msky130_fd_pr__pfet_01v8_lvt[w]
let mm1=@m.xm1.msky130_fd_pr__pfet_01v8_lvt[m]
let weff1=wm1*mm1
let jd1=id1/weff1
let wm13=@m.xm13.msky130_fd_pr__pfet_01v8_lvt[w]
let mm13=@m.xm13.msky130_fd_pr__pfet_01v8_lvt[m]
let weff13=wm13*mm13
let id13=@m.xm13.msky130_fd_pr__pfet_01v8_lvt[id]
let jd13=id13/weff13
let gm13=@m.xm13.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm3=@m.xm3.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm4=@m.xm4.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm5=@m.xm5.msky130_fd_pr__nfet_01v8_lvt[gm]
let gm6=@m.xm6.msky130_fd_pr__nfet_01v8_lvt[gm]
let gm7=@m.xm7.msky130_fd_pr__nfet_01v8_lvt[gm]
let gm8=@m.xm8.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm9=@m.xm9.msky130_fd_pr__nfet_01v8_lvt[gm]
let gm1=@m.xm1.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm2=@m.xm2.msky130_fd_pr__pfet_01v8_lvt[gm]
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


print vbg vgate vg va vb vx vq
print vdsat1 vdsat2 vdsat3 vdsat4 
+ vdsat5 vdsat6 vdsat7 vdsat8 vdsat9 vdsat13 
.endc
"}
C {devices/launcher.sym} 1380 -650 0 0 {name=h2
descr="View Raw file" 
tclcommand="textwindow $netlist_dir/[file tail [file rootname [ xschem get schname 0 ] ] ].raw"
}
C {devices/code_shown.sym} -190 -660 0 0 {name=NGSPICE
only_toplevel=true
spice_ignore=false
value="
.option savecurrents
.option warn=1
.param VDD=1.8
.param R3val='22.187k'
.param alpha='1'
.param R2R3ratio='5.6555038*alpha'
.param R2val='R3val*R2R3ratio' 
.param R4R2ratio=0.79694273
.param R4val='R2val*R4R2ratio'
*.nodeset v(vgate)=1.3
.option temp=0
.dc temp -10 80 10m
.control
save all

run
*plot Vbg
*plot deriv(Vbg)
save vbg deriv(vbg)

let indx27 = 3700
let indx0 = 1000
let indx70 = 8000

*indx is the index of temperature sweep for 27degC
echo 'Vbg @ 27degC'
let vbg27c = vbg[indx27]
print vbg27c

echo 'dVbe/degC & ppm @ 27degC'

print deriv(vbg)[indx27] deriv(vbg)[indx27]/vbg27c

echo 'ppm real'

print (vbg[indx70]-vbg[indx0])/vbg[indx27]/(70-0)*1e6

*plot deriv(vbg)/vbg27c
*plot v(va, vb) vs i
*plot vm1#branch vm2#branch vm3#branch
save deriv(vbg)/vbg27c

*plot vov vsd1 vsd2 vsd3

*plot veb vptat sum
*plot deriv(veb) deriv(vptat)



write
unset askquit
quit
.endc
" }
C {devices/vsource.sym} 710 -370 0 0 {name=V2 net_name=true value="0 pulse(0V 1.8V 10us 0us 0us 5us)"}
C {devices/gnd.sym} 710 -340 0 0 {name=l16 lab=GND}
C {devices/lab_pin.sym} 710 -400 0 0 {name=l19 lab=porst}
C {devices/code_shown.sym} 1940 -500 0 0 {name=s2 
only_toplevel=true 
spice_ignore=true

value="
.option savecurrents
.param R3val='22.187k'
.param alpha='1'
.param R2R3ratio='5.6555038*alpha'
.param R2val='R3val*R2R3ratio'
.param R4R2ratio='0.79694273'
.param R4val='R2val*R4R2ratio
.control
save all
+ @m.xm1.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm2.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm3.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm4.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm5.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm6.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm7.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm8.msky130_fd_pr__pfet_01v8_lvt[gm]
+ @m.xm9.msky130_fd_pr__nfet_01v8_lvt[gm]
+ @m.xm13.msky130_fd_pr__pfet_01v8_lvt[gm]

option temp=27
tran 0.1n 20u
option temp=0
tran 0.1n 20u
option temp=70
tran 0.1n 20u
write tsmc_bandgap_real_70degc_vbg.raw vbg
setplot tran2
write tsmc_bandgap_real_0degc_vbg.raw vbg
setplot tran1
write tsmc_bandgap_real_27degc_vbg.raw vbg
.endc
"}
C {devices/code.sym} 700 -160 0 0 {name=NGSPICE1
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
C {bandgap_sky130_v1/bandgap_top.sym} 770 -460 0 0 {}
C {devices/code.sym} -380 -340 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {devices/launcher.sym} 1090 -650 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/launcher.sym} 1090 -520 0 0 {name=h16 
descr="Load custom waves" 
tclcommand="
xschem raw_read $netlist_dir/filename.raw tran

"
}
C {devices/launcher.sym} 1090 -560 0 0 {name=h17 
descr="Load waves" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw tran

"
}
C {devices/code_shown.sym} -1130 -660 0 0 {name=NGSPICE2_backup
only_toplevel=true
spice_ignore=true
value="
.option savecurrents
.option warn=1
.param VDD=1.8
.param R3val='22.187k'
.param alpha='1'
.param R2R3ratio='5.6555038*alpha'
.param R2val='R3val*R2R3ratio' 
.param R4R2ratio=0.79694273
.param R4val='R2val*R4R2ratio'
.nodeset v(vgate)=1.3
.option temp=0
.dc temp -10 80 10m
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
run
*plot Vbg
*plot deriv(Vbg)
save vbg deriv(vbg)
let i = vm3#branch
let indx27 = 3700
let indx0 = 1000
let indx70 = 8000
*indx is the index of temperature sweep for 27degC
echo 'Vbg @ 27degC'
let vbg27c = vbg[indx27]
print vbg27c
echo 'dVbe/degC & ppm @ 27degC'
print deriv(vbg)[indx27] deriv(vbg)[indx27]/vbg27c
echo 'ppm real'
print (vbg[indx70]-vbg[indx0])/vbg[indx27]/(70-0)*1e6
*plot deriv(vbg)/vbg27c
*plot v(va, vb) vs i
*plot vm1#branch vm2#branch vm3#branch
save deriv(vbg)/vbg27c
let vsg = vdd - vgate
let vsd1 = vdd - va
let vsd2 = vdd - vb
let vsd3 = vdd - vbg
let vthp = @m.xm1.msky130_fd_pr__pfet_01v8_lvt['vth']
let vov = vsg - vthp
*plot vov vsd1 vsd2 vsd3
let deltav = vb - vbneg
let r4 =vbg/vm3#branch
let r1 =va/vr1#branch
let r2 =vb/vr4#branch
let r3 =deltav/vr2#branch
let vptat =(r2/r3*deltav)
let sum = veb+vptat
*plot veb vptat sum
*plot deriv(veb) deriv(vptat)
save veb vptat sum deriv(veb) deriv(vptat)
let gm1=@m.xm1.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm2=@m.xm2.msky130_fd_pr__pfet_01v8_lvt[gm]
let Av2=gm2 * ((r3 + r3/ln(39)) * r2 / (r3 + r3/ln(39) + r2) )
let Av1=gm1 * (r1 * r3/ln(39))/(r1 + r3/ln(39))
*plot Av1 Av2 Av2/Av1
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
save (vdd-va-vdsat1) (vdd-vb-vdsat2) (vdd-vbg-vdsat3)
+ (vdd-vgate-vdsat4) (vgate-vq-vdsat5) (vq-0-vdsat6)
+ (vx-0-vdsat7) (vdd-vg-vdsat8) (vg-vq-vdsat9) (vdd-vx-vdsat13)

write
unset askquit
quit
.endc
" }
