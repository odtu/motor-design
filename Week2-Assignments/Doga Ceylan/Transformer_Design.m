%GIVEN SPECS

V1=34500;%V
V2=400;%V
S=1e6;%VA
f=50;%hz

J_max=3;%A/mm2
core_loss=1;%W/kg @1 T, 2.5 W/kg @1.5 T (There are better laminations)
resistivity_copper=1.7e-8;%Ohm.m (goes up with temperature)
fill_factor=0.6;
mu_init=1000;
L_leakage=0.04;%pu
core_cost_per_kg=3;%dolar per kg
copper_cost_per_kg=10;%dolar per kg

% STEP 1
B_max=1.5;%Tesla

%STEP 2
k_turn=2;
N1=345*k_turn;
N2=4*k_turn;

%STEP3
%E_rms=4.44*Fi_max*f*N=4.44*B_max*A*f*N
A=(V1/sqrt(2))/(4.44*B_max*f*N1);%m^2
l=sqrt(A);%assume square crossection

%STEP4
%maybe later

%STEP5-6
I1=S/V1;
I2=S/V2;
A_Cable_1=(I1/J_max)/1e6;
A_Cable_2=(I2/J_max)/1e6;
r1=sqrt(A_Cable_1/pi);
r2=sqrt(A_Cable_2/pi);
window_1=r1*2*N1;
window_2=r2*2*N2;

%STEP7
Volume_core=2*((A*window_1)+(A*(l+l+window_1)));
d_core=7.9e3;%kg/m^3
mass_core=Volume_core*d_core;
P_core=1*mass_core;%Watt
cost_core=core_cost_per_kg*mass_core;

%STEP8
l_cable_1=N1*4*l;
l_cable_2=N2*4*l;
R_cable_1=resistivity_copper*l_cable_1/A_Cable_1;
R_cable_2=resistivity_copper*l_cable_2/A_Cable_2;
P_copper_1=I1*I1*R_cable_1;
P_copper_2=I2*I2*R_cable_2;
Volume_copper=(l_cable_1*A_Cable_1)+(l_cable_2*A_Cable_2);
d_copper=8960;
mass_copper=Volume_copper*d_copper;
cost_copper=mass_copper*copper_cost_per_kg;

%STEP9
%L=lamda/I=NFi/I=NBA/I
Lm=N1*B_max*A/I1;
L2=N2*B_max*A/I2;

%STEP10
P_loss_total=P_copper_1+P_copper_2+P_core;
pf=0.9;%pf=P/S
P_out=0.9*S;
efficieny=P_out/(P_loss_total+P_out);
cost_total=cost_copper+cost_core;





