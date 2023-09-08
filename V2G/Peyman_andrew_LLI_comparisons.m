close all
clear all

set(groot,'defaultAxesXGrid','on')
set(groot,'defaultAxesYGrid','on')


%% Import data
A(1)=importdata("F:\Git Hub rep\PyBaMM\V2G\plating\Peyman_1C_Feb142.mat");
A(2)=importdata("F:\Git Hub rep\PyBaMM\UMBLFeb 2022\Andrew_100DOD_experiment_feb142.mat");
nn=length(A);
legends=[ "NMC111", "NMC622"];
% colorlist=["-b", "--b", "-r", "--r" , "-k", "--k","-g" , "--g"];
colorlist=[ "-k",  "--k" ];
%% thruput each cycle
for i=1:nn
    A(i).T_P_av=trapz(A(i).t (A(i).t <5e4),abs(A(i).I (A(i).t <5e4)))/3600;
end


%%

figure(9); hold on;
for i=1:nn
   plot(A(i).cycle_num , A(i).LLI ,colorlist(i) , 'LineWidth',2);
end
legend(legends)
title("LLI", 'FontSize',16); xlabel("Days"); ylabel("%")

% figure(190);hold on;
% for i=1:nn
%    plot(A(i).cycle_num*A(i).T_P_av , A(i).x100 , colorlist(i) ,'LineWidth',2);
% end
% legend(legends)
% title("LLI", 'FontSize',16); xlabel("Throughput (Ah)"); ylabel("%")
%% LLI portions

 %%
A(1).Initial_mol=.1885;
A(2).Initial_mol=.095;

for i=1:nn
    A(i).time_scale=max(A(i).t)/double(max(A(i).cycle_num));
    A(i).LLI_plating_interp=interp1(A(i).t/A(i).time_scale,A(i).LLI_plating_mol/A(i).Initial_mol*100,double(A(i).cycle_num));
    A(i).LLI_SEI_interp=interp1(A(i).t/A(i).time_scale,A(i).LLI_SEI_mol/A(i).Initial_mol*100,double(A(i).cycle_num));
    A(i).LLI_LAM=A(i).LLI-A(i).LLI_plating_interp-A(i).LLI_SEI_interp;
end

figure(91);
hold on 
for i=1:nn
   plot(A(i).cycle_num , A(i).LLI_plating_interp , colorlist(i) ,'LineWidth',2);
end
legend(legends)
title("LLI due to plating", 'FontSize',16); xlabel("Days"); ylabel("%")

figure(92); hold on;
for i=1:nn
   plot(A(i).cycle_num , A(i).LLI_SEI_interp ,colorlist(i) , 'LineWidth',2);
end
title("LLI due to SEI", 'FontSize',16); xlabel("Days"); ylabel("%")

figure(93)
hold on
for i=1:nn
   plot(A(i).cycle_num , A(i).LLI_LAM ,colorlist(i) , 'LineWidth',2);
end
title("LLI due to LAM", 'FontSize',16); xlabel("Days"); ylabel("%")