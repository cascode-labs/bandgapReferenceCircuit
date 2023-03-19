v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
P 4 5 870 -300 970 -300 970 -160 870 -160 870 -300 {}
T {IO Pins} 890 -280 0 0 0.4 0.4 {}
N 440 -380 570 -380 { lab=Vb}
N 220 -90 220 -60 { lab=GND}
N 160 -120 220 -120 { lab=GND}
N 160 -120 160 -60 { lab=GND}
N 440 -380 440 -360 { lab=Vb}
N 440 -300 440 -280 { lab=#net1}
N 570 -380 570 -360 { lab=Vb}
N 570 -300 570 -280 { lab=#net2}
N 90 -380 90 -360 { lab=Va}
N 90 -300 90 -280 { lab=#net3}
N 440 -220 440 -150 { lab=vbneg}
N 90 -200 90 -60 { lab=GND}
N 570 -190 570 -60 { lab=GND}
N 480 -120 480 -60 { lab=GND}
N 440 -90 440 -60 { lab=GND}
N 400 -120 440 -120 { lab=GND}
N 400 -120 400 -60 { lab=GND}
N 260 -120 280 -120 { lab=GND}
N 280 -120 280 -60 { lab=GND}
N 70 -250 70 -200 { lab=GND}
N 70 -200 90 -200 { lab=GND}
N 550 -250 550 -190 { lab=GND}
N 550 -190 570 -190 { lab=GND}
N 340 -250 420 -250 { lab=GND}
N 340 -250 340 -60 { lab=GND}
N 220 -300 220 -150 { lab=Veb}
N 330 -380 440 -380 { lab=Vb}
N 220 -380 220 -360 { lab=Va}
N 220 -380 290 -380 { lab=Va}
N 90 -380 220 -380 { lab=Va}
N 160 -60 220 -60 { lab=GND}
N 90 -60 160 -60 { lab=GND}
N 480 -60 570 -60 { lab=GND}
N 440 -60 480 -60 { lab=GND}
N 400 -60 440 -60 { lab=GND}
N 340 -60 400 -60 { lab=GND}
N 220 -60 280 -60 { lab=GND}
N 90 -220 90 -200 { lab=GND}
N 570 -220 570 -190 { lab=GND}
N 280 -60 340 -60 { lab=GND}
N 570 -60 740 -60 {
lab=GND}
N 740 -220 740 -60 {
lab=GND}
N 720 -250 720 -190 {
lab=GND}
N 720 -190 740 -190 {
lab=GND}
N 740 -380 740 -280 {
lab=vbg}
C {sky130_fd_pr/pnp_05v5.sym} 240 -120 0 1 {name=Q2
model=pnp_05v5_W3p40L3p40
spiceprefix=X
}
C {devices/gnd.sym} 250 -60 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 290 -380 3 0 {name=l5 lab=Va}
C {devices/lab_pin.sym} 330 -380 3 0 {name=l6 lab=Vb}
C {devices/ammeter.sym} 570 -330 0 0 {name=Vr4 current=5.7238e-06}
C {devices/ammeter.sym} 440 -330 0 0 {name=Vr2 current=4.3334e-06}
C {devices/ammeter.sym} 90 -330 0 0 {name=Vr1 current=5.7228e-06}
C {devices/ammeter.sym} 220 -330 0 0 {name=Vq2 current=4.3346e-06}
C {sky130_fd_pr/pnp_05v5.sym} 460 -120 0 1 {name=Q1
model="pnp_05v5_W3p40L3p40 m=39"
spiceprefix=X
}
C {devices/lab_pin.sym} 440 -190 0 0 {name=l4 lab=vbneg}
C {devices/lab_pin.sym} 220 -270 2 0 {name=l10 lab=Veb}
C {sky130_fd_pr/res_xhigh_po_0p35.sym} 90 -250 0 0 {name=R1
W=0.35
L=21.839
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po_0p35.sym} 570 -250 0 0 {name=R2
W=0.35
L=21.839
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po_0p35.sym} 440 -250 0 0 {name=R3
W=0.35
L=3.763
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {devices/ngspice_probe.sym} 220 -380 0 0 {name=r4}
C {devices/ngspice_probe.sym} 440 -380 0 0 {name=r5}
C {devices/ngspice_probe.sym} 440 -190 0 0 {name=r9}
C {sky130_fd_pr/res_xhigh_po_0p35.sym} 740 -250 0 0 {name=R6
W=0.35
L=17.38
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} 740 -380 0 0 {name=l2 lab=vbg}
C {devices/ngspice_probe.sym} 740 -320 0 0 {name=r8}
C {devices/ipin.sym} 940 -240 0 0 {name=p1 lab=Va}
C {devices/ipin.sym} 940 -220 0 0 {name=p2 lab=Vb}
C {devices/iopin.sym} 940 -200 2 0 {name=p3 lab=vbg}
