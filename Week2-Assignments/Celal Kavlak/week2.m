CurrentDensity= 3*10^6 ;%A/m2 (Can be increased with force cooling)
B = 1.5 ;%T
corelossperkg= 3*B-2; %W/kg @1 T, 2.5 W/kg @1.5 T (There are better laminations)
copperresistivity= 1.7*10^-8; % Ohm.m (goes up with temperature);
copperdensity= 9000;% kg/m^3
coredensity= 8000;% kg/m^3
fillfactor= 0.4;
Permeability= 1000;% (can be modified)
LeakageInductance= 0.04*(34500^2/10^6); %ohm
corecostperkg= 3; %$/kg
coppercostperkg= 10; %$/kg
f=50;

N1=3450/20;
N2=40/20;

Vin=34500; %Vrms
Vout=400;  %Vrms

S=10^6;   %V*A
Iinput = S/Vin;
Iout= S/Vout;

corecross=Vin/(4.44*f*N1*B) ;%m^2

% core section is assumed to be square.

coresecdim=sqrt(corecross);

cableincross= Iinput/CurrentDensity; %m^2
cableoutcross= Iout/CurrentDensity;
%cable section is assumed to be circular.

totalcableincross=cableincross*N1;
totalcableoutcross=cableoutcross*N2;

totalcablecross=totalcableincross+totalcableoutcross;
windowarea=totalcablecross/fillfactor;%0.6 is not used for margin,by arranging denominator,
%we can change the core dimensions.It is assumed that coils are overlapped.

coreinnerlength=sqrt(windowarea);
meanlength=coreinnerlength+coresecdim;
coreouterlength=meanlength+coresecdim;


cableradius1= sqrt(cableincross/pi);
cableradius2= sqrt(cableoutcross/pi);

lengthoncore1=2*cableradius1*N1;
lengthoncore2=2*cableradius2*N2;

coremass=(coreouterlength^2-coreinnerlength^2)*coresecdim*coredensity;

coillengthtotal1=N1*4*(coresecdim+cableradius1);
coillengthtotal2=N1*4*(coresecdim+cableradius2);

coilmass1=coillengthtotal1*cableincross*copperdensity;
coilmass2=coillengthtotal2*cableoutcross*copperdensity;

resistancecoil1= (coillengthtotal1*copperresistivity)/cableincross;
resistancecoil2= (coillengthtotal2*copperresistivity)/cableoutcross;

H=B/Permeability; %A/m

reluctance= (4*meanlength)/(Permeability*corecross);
Lm=N1^2/reluctance ;
%load is assumed to be resistive.
coreloss=corelossperkg*coremass; %W
coilloss2=Iout^2*resistancecoil2;
terminalvoltage2= 400*((10^6+coilloss2)/10^6);
terminalvoltage1=terminalvoltage2*(N1/N2);

I1=sqrt((10^6+coilloss2+coreloss)^2+(terminalvoltage2/Lm)^2)/terminalvoltage1;
coilloss1=I1^2*resistancecoil1;
efficiency=((10^6)/(10^6+coilloss1+coilloss2+coreloss))*100; % %
corecost=corecostperkg*coremass;
coppercost=(coilmass1+coilmass2)*coppercostperkg;

A=[N1 N2 fillfactor B coremass coilmass1+coilmass2 resistancecoil1 resistancecoil2 Lm coreloss coilloss1+coilloss2 efficiency meanlength corecost coppercost];