
%This is the code for iteration of N2 and Bcore. The results are in the aa
%matrix and the results are also copied to an excel sheet where it is
%possible to find each parameter for different values of Bcore and N2. I
%choose N2 since it is desired a 1MVA at the output. May have mistakes.
%Note: This is a 3phase transformer.

v_1=34500;
v_2=400;
Srated=1000000;
currentdensity=3;
copperdensity= 1.7*10^(-8);
fillfactor=0.6;
permiability=4*pi*10^(-4);
leakage_inductance=0.04;
corecost=3;
coppercost=10;
I2=Srated/(v_2*sqrt(3));
aa=zeros(100);
cnt1=1;
cnt2=1;

for(B=1:0.1:1.7)
    for(N2=1:1:15)
      %assume linear increase in the core loss.(interpolation)
      lossperkg=3*B-2;
      
      meanlength=permiability*N2*I2/B;
      area=400*sqrt(2)/(N2*B*2*pi*50);
      N1=round(N2*34500/400);
      Rcore=meanlength/(permiability*area);
      Lm=(N1^2)/Rcore; %assumption
      d=sqrt(area); %m
      I1=I2*N2/N1; %A
      coparea1=10^(-6)*I1/3; %m^2
      coparea2=10^(-6)*I2/3; %mm^2
      
      if( ((meanlength/4-sqrt(area))^2)> 0.6*(N1*coparea1+N2*coparea2))
          %here I assumed that the meanlength is in the middle of the core
          coplength1=2*pi*N1*(d/2+sqrt(coparea1/(pi)));
          coplength2=2*pi*N2*(d/2+sqrt(coparea2/(pi)));
          R1=copperdensity*coplength1/coparea1;
          R2=copperdensity*coplength2/coparea2;
           %assume leakage inductance as a coil in air.
           L1=(N1^2)*4*pi*10^(-7)*pi*((d/2+sqrt(coparea1/(pi)))^2)/(meanlength-sqrt(area));
          L2=(N2^2)*4*pi*10^(-7)*pi*((d/2+sqrt(coparea2/(pi)))^2)/(meanlength-sqrt(area));
          
          corevolume=area*(meanlength+4*sqrt(area));
          coreweight=corevolume*7850;
          copvolume1= coparea1*coplength1;
           copvolume2= coparea1*coplength2;
           copweight=(copvolume1+copvolume2)*8940;
           cost=(copvolume1+copvolume2)*8940*coppercost +coreweight*corecost;
           
           Pcopper=3*(I1^2)*(R1+R2*(N1/N2)^2);
           Pcore=coreweight*lossperkg;
           efficiency = 100*Srated/(Srated+Pcopper+Pcore);
           
            aa(cnt1,cnt2)=N1;
            aa(cnt1,cnt2+1)= N2;
            aa(cnt1,cnt2+2)= B;
            aa(cnt1,cnt2+3)= coreweight;
            aa(cnt1,cnt2+4)=copweight;
            aa(cnt1,cnt2+5)=R1;
            aa(cnt1,cnt2+6)= R2;
            aa(cnt1,cnt2+7)=Lm;
            aa(cnt1,cnt2+8)=Pcore;
            aa(cnt1,cnt2+9)= Pcopper;
            aa(cnt1,cnt2+10)=efficiency;
             aa(cnt1,cnt2+11)=cost;
             aa(cnt1,cnt2+12)=corevolume;
             
           
                         
           end
                cnt1=cnt1+1; 
                cnt2=1;
          
      end
        
        
        
        
    end
