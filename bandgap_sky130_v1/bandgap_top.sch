v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
P 4 5 1120 40 1220 40 1220 180 1120 180 1120 40 {}
T {IO Pins} 1140 60 0 0 0.4 0.4 {}
T {vout} 95 -4 0 1 0.2 0.2 {}
N 60 -100 90 -100 {
lab=Va}
N 60 -60 90 -60 {
lab=Vb}
N 660 180 690 180 {
lab=Va}
N 660 200 690 200 {
lab=Vb}
N 380 -170 600 -170 { lab=VDD}
N 600 -170 800 -170 { lab=VDD}
N 600 -40 600 30 { lab=#net1}
N 880 -170 1000 -170 { lab=VDD}
N 600 -170 600 -100 { lab=VDD}
N 1000 -80 1010 -80 { lab=VDD}
N 1010 -110 1010 -80 { lab=VDD}
N 1000 -110 1010 -110 { lab=VDD}
N 560 -80 560 -70 { lab=vgate}
N 340 -80 340 -70 { lab=vgate}
N 380 -40 380 20 { lab=#net2}
N 380 -70 390 -70 { lab=VDD}
N 390 -100 390 -70 { lab=VDD}
N 380 -100 390 -100 { lab=VDD}
N 380 -170 380 -100 { lab=VDD}
N 600 -70 610 -70 { lab=VDD}
N 610 -100 610 -70 { lab=VDD}
N 600 -100 610 -100 { lab=VDD}
N 930 -80 960 -80 { lab=vgate}
N 1000 -170 1000 -110 { lab=VDD}
N 1000 -50 1000 -20 { lab=#net3}
N 340 -80 560 -80 { lab=vgate}
N 820 0 830 0 { lab=GND}
N 820 30 830 0 { lab=GND}
N 820 -80 820 -30 { lab=vgate}
N 730 -170 730 -150 { lab=VDD}
N 730 -90 730 -80 { lab=vgate}
N 270 -80 290 -80 {
lab=vgate}
N 290 -80 340 -80 {
lab=vgate}
N 560 -80 930 -80 {
lab=vgate}
N 380 80 380 180 {
lab=Va}
N 380 180 660 180 {
lab=Va}
N 600 90 600 200 {
lab=Vb}
N 600 200 660 200 {
lab=Vb}
N 1000 40 1000 180 {
lab=vbg}
N 820 180 1000 180 {
lab=vbg}
N 820 20 820 70 {
lab=GND}
N 820 200 820 250 {
lab=GND}
N 160 -30 160 20 {
lab=GND}
N 800 -170 880 -170 {
lab=VDD}
N 380 180 380 200 {
lab=Va}
N 430 -200 430 -170 {
lab=VDD}
N 230 -80 270 -80 {
lab=vgate}
N 160 -170 160 -120 {
lab=VDD}
N 160 -170 380 -170 {
lab=VDD}
N 160 -40 160 -30 {
lab=GND}
N 820 250 820 260 {
lab=GND}
N 380 260 820 260 {
lab=GND}
C {bandgap_sky130_v1/cascode_amplifier_with_bias-ckt.sym} 170 -80 0 0 {name=x1}
C {bandgap_sky130_v1/cascode_bandgapCore.sym} 750 190 0 0 {name=x2}
C {devices/lab_pin.sym} 60 -100 0 0 {name=p1 sig_type=std_logic lab=Va}
C {devices/lab_pin.sym} 60 -60 0 0 {name=p2 sig_type=std_logic lab=Vb}
C {devices/ammeter.sym} 380 50 0 0 {name=Vm1 current=1.0057e-05}
C {devices/ammeter.sym} 600 60 0 0 {name=Vm2 current=1.0057e-05}
C {devices/ammeter.sym} 1000 10 0 0 {name=Vm3 current=1.0239e-05}
C {devices/lab_wire.sym} 530 -80 0 0 {name=l11 lab=vgate}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 360 -70 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} 580 -70 0 0 {name=M2
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} 980 -80 0 0 {name=M3
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
C {devices/ngspice_probe.sym} 530 -80 0 0 {name=r5}
C {devices/ngspice_get_value.sym} 1010 -30 0 0 {name=r22 node=@m.xm3.msky130_fd_pr__pfet_01v8_lvt[gm]
descr="gm="}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 800 0 0 0 {name=M10
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
C {devices/lab_pin.sym} 780 0 0 0 {name=l15 lab=porst}
C {devices/capa.sym} 730 -120 0 0 {name=C1
m=1
value=20p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 820 70 3 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 820 260 3 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 160 20 3 0 {name=l2 lab=GND}
C {devices/capa.sym} 380 230 0 0 {name=C2
m=1
value=20p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 1000 100 0 0 {name=p5 sig_type=std_logic lab=vbg}
C {devices/lab_pin.sym} 430 -200 1 0 {name=l8 lab=VDD}
C {devices/ipin.sym} 1190 100 0 0 {name=p6 lab=VDD
}
C {devices/ipin.sym} 1190 120 0 0 {name=p7 lab=GND
}
C {devices/iopin.sym} 1190 140 2 0 {name=p8 lab=porst
}
C {devices/iopin.sym} 1190 160 2 0 {name=p9 lab=vbg}
C {devices/lab_wire.sym} 380 120 0 0 {name=p3 sig_type=std_logic lab=Va}
C {devices/lab_wire.sym} 600 120 0 0 {name=p4 sig_type=std_logic lab=Vb}
