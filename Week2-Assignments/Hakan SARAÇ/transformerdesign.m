clear
t = 0:0.001:10;

Bmax = 1; %tesla
f = 50;
Vpri = 34500;
Vsec = 400;
N1 = 173;
N2 = 2;


%B = Bmax*sin(2*pi*f*t); %is there sqrt(2)?
Ipri = 29; %A
Isec = 2500; %A
u0 = 4*pi*10^-7;
ur = 1000;
u = u0*ur;


% we know that Emax=2*pi*f*N*Bmax*Area
% all values are known except for area
% then
Emax = 400*sqrt(2);
Area = Emax/(2*pi*f*N2*Bmax);
flux = Bmax*Area;

Emax2 = 34500*sqrt(2);
Area2 = Emax2/(2*pi*f*N1*Bmax);
flux2 = Bmax*Area2;

%assuming square core, one side width and height of the core will be
depth = sqrt(Area);
width = sqrt(Area);


%to find effective length
%using NI = flux*relutance
%relutance = length/(u*A)

length_effective = N2*Isec*u*Area/flux;
reluctance = length_effective/(u*Area);
sidelength_effective = length_effective/4;

inner_space_area = (sidelength_effective-depth)^2;
outer_space_area = (sidelength_effective+depth)^2;
current_density = 3 ; %A/mm2

%the copper on secondary side there will be N2 number of turns
copper_area_sec_percoil = Isec/current_density; %mm2
copper_area_sec_total = N2*copper_area_sec_percoil; %mm2
copper_radius_sec_coil = sqrt(copper_area_sec_percoil/pi); %mm

copper_area_pri_percoil = Ipri/current_density; %mm2
copper_area_pri_total = N1*copper_area_pri_percoil; %mm2
copper_radius_pri_coil = sqrt(copper_area_pri_percoil/pi); %mm

total_copper_area = (copper_area_pri_total + copper_area_sec_total)*10^-6; %m2
fill_factor = total_copper_area/inner_space_area;





















