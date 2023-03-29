v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
P 4 5 680 -280 800 -280 800 -80 680 -80 680 -280 {}
T {I/O Pins} 710 -260 0 0 0.3 0.3 {}
N 370 -200 370 -180 {
lab=GND}
N 490 -200 490 -110 {
lab=OUT3}
N 250 -200 250 -110 {
lab=OUT2}
N 130 -200 130 -110 {
lab=OUT1}
N 210 -230 210 -40 {
lab=IN}
N 90 -230 90 -40 {
lab=IN}
N 450 -230 450 -40 {
lab=IN}
N 370 -260 410 -260 {
lab=IN}
N 410 -260 410 -40 {
lab=IN}
N 590 -190 590 -40 {
lab=IN}
N 90 -40 590 -40 {
lab=IN}
N 130 -350 130 -260 {
lab=VDD}
N 250 -350 250 -260 {
lab=VDD}
N 490 -350 490 -260 {
lab=VDD}
N 590 -350 590 -250 {
lab=VDD}
N 130 -350 590 -350 {
lab=VDD}
N 40 -40 90 -40 {
lab=IN}
N 370 -390 370 -350 {
lab=VDD}
N 130 -280 140 -280 {
lab=VDD}
N 140 -280 140 -230 {
lab=VDD}
N 130 -230 140 -230 {
lab=VDD}
N 250 -230 260 -230 {
lab=VDD}
N 260 -280 260 -230 {
lab=VDD}
N 250 -280 260 -280 {
lab=VDD}
N 370 -230 380 -230 {
lab=GND}
N 380 -230 380 -190 {
lab=GND}
N 370 -190 380 -190 {
lab=GND}
N 490 -230 500 -230 {
lab=VDD}
N 500 -270 500 -230 {
lab=VDD}
N 490 -270 500 -270 {
lab=VDD}
C {devices/gnd.sym} 370 -180 0 0 {name=l2 lab=GND}
C {devices/capa.sym} 590 -220 0 0 {name=C1
m=1
value=20p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 330 -230 0 0 {name=l4 lab=PIN}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 110 -230 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} 230 -230 0 0 {name=M2
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} 470 -230 0 0 {name=M3
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
C {sky130_fd_pr/nfet_01v8_lvt.sym} 350 -230 0 0 {name=M10
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
C {devices/lab_pin.sym} 40 -40 0 0 {name=p1 sig_type=std_logic lab=IN}
C {devices/lab_pin.sym} 130 -110 2 0 {name=p2 sig_type=std_logic lab=OUT1}
C {devices/lab_pin.sym} 250 -110 2 0 {name=p3 sig_type=std_logic lab=OUT2}
C {devices/lab_pin.sym} 490 -110 2 0 {name=p4 sig_type=std_logic lab=OUT3}
C {devices/lab_pin.sym} 370 -390 1 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/ipin.sym} 710 -220 2 0 {name=p6 lab=IN}
C {devices/opin.sym} 710 -160 0 0 {name=p8 lab=OUT2}
C {devices/iopin.sym} 710 -120 0 0 {name=p9 lab=VDD}
C {devices/iopin.sym} 710 -100 0 0 {name=p10 lab=GND}
C {devices/opin.sym} 710 -140 0 0 {name=p7 lab=OUT3}
C {devices/opin.sym} 710 -180 0 0 {name=p11 lab=OUT1}
C {devices/ipin.sym} 710 -200 2 0 {name=p12 lab=PIN}
