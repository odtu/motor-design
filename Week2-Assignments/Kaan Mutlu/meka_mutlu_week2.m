%% Motor Design Workshop: Week-2
%%
% *Mehmet Kaan Mutlu*
%  
% *E-mail :* kaan.mutlu@metu.edu.tr

function []=meka_mutlu_week2()

%% Specifications 
%%
% 
% * *Single Phase, 50 Hz Transformer*
% * *Primary Winding Voltage:* 34.5 kV
% * *Secondary Winding Voltage:* 400 V
% * *Rated Power:* 1 MVA 
% * *Switching Frequency:* 50 Hz
Srated      = 1e6; % Rated power [VA]
fs          = 50; % switching frequency [Hz]
%%
% Efficiency is targeted as 99%. Therefore Rated power will be used as 
% ~1.01 MVA.
%%
Srated = Srated/0.99;
%%
Vp_rms     = 34.5e3; % Primary side rms voltage [V]
%%
Vs_rms     = 400; % Secondary side rms voltage [V]
%%
Ip_rms      = Srated/Vp_rms; % Primary side RMS current [A]
Is_rms      = Srated/Vs_rms;  % Secondary side RMS current [A]
fprintf('The RMS value of primary side current is %1.2f A.',Ip_rms)
%% 
fprintf('The RMS value of secondary side current is %2.2f kA.',Is_rms*10^-3)

%% Choosing Operation Flux Density

%%
% For the first phase of design, it is going to be choosen operation flux
% density. Let's consider over the formula below:
% 
% $e = -\frac{2*\pi}{\sqrt{2}}N2{\pi}fB_{peak}*A$
% 
% If only selectable parameters are considered, it is possible to see the
% trade-off between number of turns, flux density and area. Selecting high 
% number of turns come with dificulties of cabling and copper losses. Cable
% size is decided over current values so it is constant in this discussion.
% Area is important for transformer's size and weight values. It also
% effects cable length and core loss (over weight). Flux density is
% directly related with core losses. 
%  
% Therefore design will be done for a value between 1 T and 1.5 T and
% results will be compared.

B_opr = 1:0.1:1.5; %[T]

%% Determination of Cable Thickness

%%
% Independetly from core dimensions and number of turns, diameter of cable
% might be determined.  
%  
% Here is a practical AWG table : <https://en.0wikipedia.org/index.php?q=aHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvQW1lcmljYW5fd2lyZV9nYXVnZQ>
%  
% For the primary side AWG 10 can be used. Secondary side's rms current
% value is very high. Therefore 11 paralleled AWG 4/0 cable will be used.

A_awg10 = pi*(0.5*2.588*10^-3)^2; %[m^2]
A_awg0000 = pi*(0.5*11.684*10^-3)^2; %[m^2]
fprintf('Cross-section area of a AWG 10 wire is %0.3f mm^2.',A_awg10*10^6)
%%
fprintf('AWG 4/0 wire''s is %0.3f mm^2. Eleven of them will be used.',A_awg0000*10^6)

%%
% For each operating flux density values, different core cross section
% areas will be tested and logical number of turnes will be calculated in
% each phase. After each steps are completed, copper and core losses
% will be calculated and minimum loss condition will be choosen.

%%
% Let us take a core cross section are interval between 4 cm^2 and 3600
% cm^2.

A_core = (4:1:3600).*10^-4; %[m^2]

results = Core_selection();

%% Specifications 
%%
% All of these calculations shows that
%%
fprintf('It is better choose operating flux density as %1.1f T.',results(1));
%%
fprintf('Primary side turns becomes %d and secondary becomes %d.',results(2),results(3));
%%
fprintf('Cross section are is %d cm^2  and core length is %1.1f m.',results(4)*10^4,results(5));
%%
fprintf('Mass of the core becomes %1.2f kg. It means %1.2f kW of core loss.',results(6),results(7)*10^-3);
%%
fprintf('Length of the primary side cable is %1.2f m. Its resistance is %1.2f ohm.',results(8),results(9));
%%
fprintf('Secondary side''s length is %1.2f m and its resistance is %1.2f miliohm .',results(10),results(11)*10^3);
%%
Mass_Cu = (results(8)*A_awg10 + results(10)*A_awg0000*11)*8.96*10^6*10^-3;
fprintf('Total mass of the copper is %1.2f kg.',Mass_Cu);
%%
fprintf('So the total mass is  %1.2f kg.',Mass_Cu+results(6));
%%
fprintf('Inductance is calculated as %1.2f mH and leakage is %1.2f mH.',results(12)*10^3,results(13)*10^3);
%%
%%
fprintf('Copper lose is  %1.2f kW and efficiency becomes %1.2f %% as targeted.',results(14)*10^-3, (1-(results(14)+results(7))/Srated)*100);
%%
fprintf('Copper cost is  %1.2f $ and core material cost is %1.2f $.',Mass_Cu*10, results(6)*3);
%%
    function [output] = Core_selection()
        rho_Cu = 1.7*10^-8;
        cnt=0;
        for j=1:length(B_opr)
            for i=1:length(A_core)
                cnt = cnt + 1;
                N_turns_s(cnt) = ceil(Vs_rms/((4.44)*2*pi*fs*B_opr(j)*A_core(i)));
                N_turns_p(cnt) = N_turns_s(cnt)*Vp_rms/Vs_rms;
                l_core = N_turns_p(cnt)*Ip_rms/(B_opr(j)/(4*pi*10^-7*1000));
                Area_max = 0.6*((l_core/4)-sqrt(A_core(i)))^2;
                Area_used = ((N_turns_p(cnt))*A_awg10+(N_turns_s(cnt))*A_awg0000*11);
                length_P(cnt) = N_turns_p(cnt)*4*sqrt(A_core(i))/0.6;
                R_P(cnt) = rho_Cu*length_P(cnt)/A_awg10;
                Cu_losses(cnt) = (Ip_rms^2)*R_P(cnt);
                length_S(cnt) = N_turns_s(cnt)*4*sqrt(A_core(i))/0.6;
                R_S(cnt) = rho_Cu*length_S(cnt)/(A_awg0000*11);
                Cu_losses(cnt) = Cu_losses(cnt)+(Is_rms^2)*R_S(cnt);
                if(Area_used>Area_max)
                    Cu_losses(cnt) = 1e6;  %for elimination
                end           
                if(N_turns_s(cnt)<4)
                    Cu_losses(cnt) = 1e6; %for elimination
                end;
                Volume(cnt) = (((l_core/4)+sqrt(A_core(i)))^2-((l_core/4)-sqrt(A_core(i)))^2)*sqrt(A_core(i));
                Mass_core(cnt) = Volume(cnt)*7.8*1e3;
                Corelosses(cnt) = Mass_core(cnt)*(1+(B_opr(j)-1)*3);
                Total_loss(cnt) = Corelosses(cnt) + Cu_losses(cnt);
                B_opr_ans(cnt) = B_opr(j);
                A_core_ans(cnt) = A_core(i);
                l_core_ans(cnt) = l_core;
                Ind(cnt) = (N_turns_p(cnt)^2)/(l_core/(1000*4*pi*10^-7*A_core(i)));
                Ind_leak(cnt) = Ind(cnt)*0.04;
            end;
        end;
        index = find(Total_loss==min(Total_loss));
        output = [B_opr_ans(index) N_turns_p(index) N_turns_s(index) A_core_ans(index) l_core_ans(index) Mass_core(index) Corelosses(index) length_P(index) R_P(index) length_S(index) R_S(index) Ind(index) Ind_leak(index) Cu_losses(index)]; 
    end      
%%
end