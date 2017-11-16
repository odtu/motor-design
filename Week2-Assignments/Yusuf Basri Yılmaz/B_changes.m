air_perm=4*pi*10^(-7);
in_perm=1000;
perm=air_perm*in_perm;
I1=16.73;
I2=1443;
f=50;
n2=6;
fill_factor=0.6;
copper_density=8960;
copper_resistivity=1.7*10^(-8);
current_density=3;
steel_density=7850;
core_cost=3;
copper_cost=10;
core_loss_density=2.5;
n=34500/400;


B=[1:0.05:1.5];
n1=round(n2*n);
n_total=n1+n2;
core_loss_density=3.*B-2;

%dimensions
A_core=400./(4.44*n2.*B.*f);
a=sqrt(A_core);
l=perm*n2*I2./B;
%Reluctance
reluctance=n2*I2./(B.*A_core);
%core
core_volume=A_core.*(l+4*a);
core_mass=core_volume*steel_density; 
total_core_cost=core_cost*core_mass;
%inductance
Lm=n1.^2./reluctance;
%copper
primer_copper_area=I1*10^(-6)/current_density;
seconder_copper_area=I2*10^(-6)/current_density;
copper_volume=4*a.*n2.*(primer_copper_area+seconder_copper_area);
copper_mass=copper_volume*copper_density;
total_copper_cost=copper_mass*copper_cost;
%total cost
total_cost=total_copper_cost+total_core_cost;
%resistors
R_primer=copper_resistivity*4*a.*n1./primer_copper_area;
R_seconder_prime=n.^2.*copper_resistivity*4*a.*n2./seconder_copper_area;

%power losses
P_copper=3*I1^2*(R_primer+R_seconder_prime);
P_core=core_loss_density.*core_mass;


        
   