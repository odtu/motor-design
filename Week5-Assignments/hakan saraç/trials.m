Bpeak = 0.6;
r_airgap_effective = 17.5*10^-3;
length = 0.1;
fluxlinkage = Bpeak*2*r_airgap_effective*length;
frequency = 25;
Vrms = 24;
fill_factor = 0.7;
J = 4 ; %A/mm2

N = Vrms/(4.44*fluxlinkage*frequency);
N = round(N);


airgap_area = pi*(20^2-15^2)*10^-6 ; %m2
total_coil_area = airgap_area*fill_factor;

coil_area_perphase = total_coil_area/3;

coil_area_percoil = coil_area_perphase/(2*N); %mm2


chosen_coil_area = 0.52*10^-6 ; %m2
I = J*chosen_coil_area*10^6;

length_per_turn = 2*(r_airgap_effective+length);
total_coil_length = length_per_turn*N; %perphase
coil_resistance = 33.31*total_coil_length/1000; %perphase

Pcopper = I^2*coil_resistance; %perphase
