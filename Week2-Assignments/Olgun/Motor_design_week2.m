S_rated = 10^6; % VA
V1 = 34.5*10^3; % V
I1 = S_rated/V1; % A
V2 = 400; % V
I2 = S_rated/V2; % A
N1 = 345;
N2 = 4;
f = 50; % Hz
Current_Density = 3; % A/mm^2
B = 1.2; % T
Core_Loss = 3*B - 2; % W/kg
Copper_Resistivity = 1.7*10^(-8); %ohm.m
u0 = 4*pi*10^(-7);
ur = 795.77;
H = B/(u0*ur);
L_leakage = 0.04;
Cost_Core = 3; % $/kg
Cost_Copper = 10; % $/kg
Steel_Density = 7850; % kg/m^3

Bmax = B*pi/2;
A = V1/(4.44*f*N1*Bmax);
l_mean = N1*I1/H;
Core_Volume = l_mean*A; % m^3
Core_Mass = Core_Volume*Steel_Density; %kg
Coil_Area1 = I1/(Current_Density*10^6);
Coil_Area2 = I2/(Current_Density*10^6);
a = sqrt(A);
Coil_Length1 = 4*a*N1;
Coil_Length2 = 4*a*N2;
Copper_Density = 8960; % kg/m^3
Copper_Volume = Coil_Length1*Coil_Area1 + Coil_Length2*Coil_Area2; % m^3
Copper_Mass = Copper_Volume*Copper_Density; % kg
R_Coil1 = Coil_Length1*Copper_Resistivity/Coil_Area1;
R_Coil2 = Coil_Length2*Copper_Resistivity/Coil_Area2;
R_Core = l_mean/(ur*u0*A);
L_m = N1^2/R_Core; % H
P_Core = Core_Loss*Core_Mass;
P_Copper = I1^2*R_Coil1 + I2^2*R_Coil2;
Efficiency = 100*(S_rated/(S_rated+P_Core+P_Copper));
Total_Cost = Core_Mass*Cost_Core + Copper_Mass*Cost_Copper;

Datasheet = table(B,N1,N2,Core_Mass,Copper_Mass,R_Coil1,R_Coil2,L_m,P_Core,P_Copper,Efficiency,Total_Cost);

filename = 'Datasheet.xlsx';
writetable(Datasheet,filename,'Sheet',1)