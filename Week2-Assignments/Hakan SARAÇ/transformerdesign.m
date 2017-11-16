clear
clc
t = 0:0.001:10;

Bmax = [0.6 0.8 1 1.2 1.5]; %tesla
f = 50;
Vpri = 34500;
Vsec = 400;
N1 = 345;
N2 = 4;


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
Area = Emax./(2*pi*f*N2.*Bmax);
flux = Bmax.*Area;

Emax2 = 34500*sqrt(2);
Area2 = Emax2./(2*pi*f*N1.*Bmax);
flux2 = Bmax.*Area2;

%assuming square core, one side width and height of the core will be
depth = sqrt(Area);
width = sqrt(Area);

current_density = 3 ; %A/mm2

%the copper on secondary side there will be N2 number of turns
copper_area_sec_percoil = Isec/current_density; %mm2
copper_area_sec_total = N2*copper_area_sec_percoil; %mm2
copper_radius_sec_coil = sqrt(copper_area_sec_percoil/pi); %mm

%the copper on secondary side there will be N1 number of turns
copper_area_pri_percoil = Ipri/current_density; %mm2
copper_area_pri_total = N1*copper_area_pri_percoil; %mm2
copper_radius_pri_coil = sqrt(copper_area_pri_percoil/pi); %mm
total_copper_area = (copper_area_pri_total + copper_area_sec_total)*10^-6; %m2
inner_space_area = total_copper_area/0.6; %m2
inner_space_side_length = sqrt(inner_space_area);
outer_side_length = inner_space_side_length + 2*width;
outer_space_area = outer_side_length.^2;


side_length_effective = outer_side_length-width;
length_effective = 4*side_length_effective;
reluctance = length_effective/(u*Area);
%%%sidelength_effective = length_effective/4;

%%%inner_space_area = (sidelength_effective-depth)^2;
%%%outer_space_area = (sidelength_effective+depth)^2;





%%%fill_factor = total_copper_area/inner_space_area;

%core&coppermass
core_surface_area = outer_space_area - inner_space_area ; %m2
core_volume = core_surface_area .* depth; %m3
core_density = 7750 ;%kg/m3
core_mass = core_volume*core_density/1000; %tons
core_material_cost = 3 ;% $/kg
core_total_cost = core_mass*1000*core_material_cost;
core_loss_values = [0.5 0.8 1 1.5 2.5];

    
core_losses = core_loss_values.*core_mass*1000; % watts


copper_volume = N1.*(width.*4).*(copper_area_pri_percoil.*10^-6) + N2.*(width.*4).*(copper_area_sec_percoil.*10^-6); %m3
copper_length_pri = 4*width.*N1;
copper_length_sec = 4*width.*N2;
copper_density = 8960 ;% kg/m3
copper_mass = copper_volume*copper_density; %kg
copper_material_cost = 10 ; %$/kg
copper_total_cost = copper_mass*copper_material_cost;

copper_resistivity = 1.7*10^-8;
copper_resistivity_pri = copper_length_pri*copper_resistivity/(copper_area_pri_percoil*10^-6);
copper_resistivity_sec = copper_length_sec*copper_resistivity/(copper_area_sec_percoil*10^-6);

Lm = N1.^2./reluctance;

copper_losses = Ipri^2*copper_resistivity_pri+Isec^2*copper_resistivity_sec;
total_losses = core_losses+copper_losses;

Pout = 1000000; %VA
Pin = Pout+total_losses;

efficiency = Pout./Pin*100; %percent

total_cost = copper_total_cost + core_total_cost;
total_mass = copper_mass + core_mass*1000;
%for a = 1:5
Lm = [Lm Lm Lm Lm Lm];
N1 = [N1 N1 N1 N1 N1];
N2 = [N2 N2 N2 N2 N2];
results = table(transpose(Bmax),core_mass',copper_mass',copper_resistivity_pri',copper_resistivity_sec',Lm',core_losses',copper_losses',efficiency',total_cost');

filename = 'results.xlsx';
writetable(results,filename,'Sheet',1)
