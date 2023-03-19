v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
P 4 5 520 -300 620 -300 620 -140 520 -140 520 -300 {}
T {I/O Pins} 530 -290 0 0 0.4 0.4 {}
N 120 -440 180 -440 { lab=vg}
N 180 -470 180 -440 { lab=vg}
N 160 -470 180 -470 { lab=vg}
N 180 -470 290 -470 { lab=vg}
N 120 -520 120 -500 { lab=VDD}
N 330 -520 330 -500 { lab=VDD}
N 120 -440 120 -370 { lab=vg}
N 330 -430 330 -370 { lab=VOUT}
N 320 -310 330 -310 { lab=Vq}
N 330 -470 340 -470 { lab=VDD}
N 340 -500 340 -470 { lab=VDD}
N 330 -500 340 -500 { lab=VDD}
N 110 -470 120 -470 { lab=VDD}
N 110 -500 110 -470 { lab=VDD}
N 110 -500 120 -500 { lab=VDD}
N 120 -340 130 -340 { lab=VSS}
N 320 -340 330 -340 { lab=VSS}
N 210 -190 220 -190 { lab=VSS}
N 210 -190 210 -160 { lab=VSS}
N 260 -190 390 -190 { lab=Vx}
N 430 -190 440 -190 { lab=VSS}
N 390 -220 390 -190 { lab=Vx}
N 390 -220 430 -220 { lab=Vx}
N 440 -190 440 -160 { lab=VSS}
N 430 -420 440 -420 { lab=VDD}
N 440 -450 440 -420 { lab=VDD}
N 430 -450 440 -450 { lab=VDD}
N 220 -310 220 -220 { lab=Vq}
N 390 -430 390 -420 { lab=VOUT}
N 430 -520 430 -450 { lab=VDD}
N 430 -220 430 -200 { lab=Vx}
N 120 -520 330 -520 { lab=VDD}
N 120 -310 130 -310 { lab=Vq}
N 220 -310 320 -310 { lab=Vq}
N 210 -160 440 -160 { lab=VSS}
N 430 -390 430 -200 { lab=Vx}
N 130 -310 220 -310 { lab=Vq}
N 330 -440 330 -430 { lab=VOUT}
N 330 -430 390 -430 { lab=VOUT}
N 330 -520 430 -520 { lab=VDD}
N 130 -340 320 -340 { lab=VSS}
N 370 -340 380 -340 {
lab=VIN-}
N 70 -340 80 -340 {
lab=VIN+}
N 390 -430 520 -430 {
lab=VOUT}
N 330 -160 330 -130 {
lab=VSS}
N 240 -560 240 -520 {
lab=VDD}
N 220 -380 220 -340 {
lab=VSS}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 350 -340 0 1 {name=M5
L='2'
W='1'
nf=1
mult=26.95
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 240 -190 0 1 {name=M6
L=2
W=1
nf=1
mult=3.65
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 100 -340 0 0 {name=M9
L='2'
W='1'
nf=1
mult=26.95
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} 240 -470 1 0 {name=l2 lab=vg}
C {devices/lab_pin.sym} 430 -200 1 0 {name=l12 lab=Vx}
C {devices/lab_pin.sym} 220 -250 0 0 {name=l18 lab=Vq}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 410 -190 0 0 {name=M7
L=2
W=1
nf=1
mult=3.65
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 410 -420 0 0 {name=M13
L=2
W=1
nf=1
mult=77.32
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/ngspice_probe.sym} 430 -170 0 0 {name=r3}
C {devices/ngspice_probe.sym} 220 -260 0 0 {name=r4}
C {devices/ngspice_probe.sym} 180 -470 0 0 {name=r6}
C {devices/ngspice_get_value.sym} 430 -290 0 0 {name=r16 node=i(@m.xm13.msky130_fd_pr__pfet_01v8_lvt[id])
descr="I="}
C {devices/ngspice_get_value.sym} 220 -240 0 0 {name=r17 node=i(@m.xm6.msky130_fd_pr__nfet_01v8_lvt[id])
descr="I="}
C {devices/ngspice_get_value.sym} 120 -370 0 0 {name=r18 node=i(@m.xm8.msky130_fd_pr__pfet_01v8_lvt[id])
descr="I="}
C {devices/ngspice_get_value.sym} 330 -370 0 1 {name=r19 node=i(@m.xm4.msky130_fd_pr__pfet_01v8_lvt[id])
descr="I="}
C {devices/ngspice_get_value.sym} 120 -410 0 0 {name=r10 node=@m.xm8.msky130_fd_pr__pfet_01v8_lvt[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 330 -410 0 1 {name=r11 node=@m.$\{path\}xm4.msky130_fd_pr__pfet_01v8_lvt[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 120 -280 0 0 {name=r12 node=@m.xm9.msky130_fd_pr__nfet_01v8_lvt[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 330 -280 0 1 {name=r13 node=@m.xm5.msky130_fd_pr__nfet_01v8_lvt[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 450 -350 0 0 {name=r14 node=@m.xm13.msky130_fd_pr__pfet_01v8_lvt[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 240 -220 0 0 {name=r15 node=@m.xm6.msky130_fd_pr__nfet_01v8_lvt[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 410 -220 0 1 {name=r23 node=@m.xm7.msky130_fd_pr__nfet_01v8_lvt[gm]
descr="gm="}
C {devices/ngspice_probe.sym} 330 -400 0 0 {name=r27}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 140 -470 0 1 {name=M4
L=2
W=1
nf=1
mult=38.66
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 310 -470 0 0 {name=M8
L=2
W=1
nf=1
mult=38.66
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/title.sym} 170 -40 0 0 {name=l1 author="Cascode Labs"}
C {devices/opin.sym} 540 -250 0 0 {name=p1 lab=VOUT}
C {devices/ipin.sym} 540 -230 2 0 {name=p2 lab=VIN+}
C {devices/ipin.sym} 540 -210 2 0 {name=p3 lab=VIN-}
C {devices/ipin.sym} 540 -190 2 0 {name=p4 lab=VDD}
C {devices/ipin.sym} 540 -170 2 0 {name=p5 lab=VSS}
C {devices/lab_pin.sym} 70 -340 0 0 {name=p6 sig_type=std_logic lab=VIN+}
C {devices/lab_pin.sym} 380 -340 2 0 {name=p7 sig_type=std_logic lab=VIN-}
C {devices/lab_pin.sym} 240 -560 1 0 {name=p8 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 330 -130 3 0 {name=p9 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 220 -380 1 0 {name=p10 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 520 -430 2 0 {name=p11 sig_type=std_logic lab=VOUT}
