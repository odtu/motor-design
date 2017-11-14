J=3;  %A/mm^2
d_cu=8900; %kg/m^3
ro_cu=1.7e-8; %ohm.m
FF=0.6;
perm_core=1000;
L_leak=0.4; % pu
price_core_per= 3;  % per kg
price_copper_per= 10; % per kg
V1=34.5e3; % V
V2=400; % V
d_steel=8000; %kg/m^3

%% To be defined
k=[1 2 4 8]; %the constant for the number of turns


%% My calculated constants to be used later

I_p=10e6./V1; %primary side current
I_s=10e6./V2; %secondary side current

A_p=(I_p.*J./1e6)./FF; %primary side exact copper area m^2
r1=sqrt(A_p./pi); %primary side copper radius m

A_s=(I_s.*J./1e6)./FF; %secondary side exact copper area m^2
r2=sqrt(A_s./pi); %secondary side copper radius m


%%

B=1;  %T
N1=345/8.*(8*k);
N2=4.*k;

%% Dimensions

A=sqrt(2)./(pi.*B.*k);
w=sqrt(A); %the width of the core 
len=2*max(r1.*N1./(8*k), r2.*N2./k); % length of the window -winding side
dead=10e-2; %dead margin to be used between windings of both sides in the window m
h=(r1+r2).*2.*k+dead; 

%% Core and Copper Losses

V_core= (w.*w.*4+2.*h.*len+w.*len*2).*w; %volume of the core
M_core=V_core.*ro_steel; % mass of the core
P_core=M_core*1; %Watts 

len_cu1=N1.*(w+2.*r1*8.*k).*2;
len_cu2=N2.*(w+2.*r2.*k).*2;

R_copper1=ro_cu.*(len_cu1./A_p);%resistance of the copper winding primary
R_copper2=ro_cu.*(len_cu2./A_s);%resistance of the copper winding secondary

P_copper=(R_copper1.*I_p.*I_p +R_copper2.*I_s.*I_s); %watts


%% Cost of the overall material

Core_cost= M_core.*price_core_per; 

%mass calculation for each side and overall
M_cu_p= len_cu1.*A_p.*d_cu;
M_cu_s=len_cu2.*A_s.*d_cu;
M_cu=M_cu_p+M_cu_s;

Copper_cost=M_cu.*price_copper_per;

