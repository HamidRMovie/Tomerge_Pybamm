%%Comparison of loss metrics

% close all
clear all

set(groot,'defaultAxesXGrid','on')
set(groot,'defaultAxesYGrid','on')


%%
P4=readmatrix("/Users/hamid/Documents/Peyman2020/esoh/aging_param_cell_13.csv");
Cyc4=P4(1:end-2,1); Cap4=P4(1:end-2,9); Cp4=P4(1:end-2,8); Cn4=P4(1:end-2,7);y0_4=P4(1:end-2,4);
x100_4=P4(1:end-2,5); x0_4=P4(1:end-2,3); y100_4=P4(1:end-2,6);
D4=load("/Users/hamid/piibamm/PyBaMM/gmproj/cycling_aging/Peyman__cell13_July25.mat");
% D4=load("/Users/hamid/piibamm/PyBaMM/V2G/plating/cell04_plating.mat");

A1=readmatrix("/Users/hamid/piibamm/PyBaMM/UMBLFeb2022/data/esoh/aging_param_cell_152002.csv");
Cyc1=A1(:,1); Cap1=A1(:,9); Cp1=A1(:,8); Cn1=A1(:,7);y0_1=A1(:,4); x100_1=A1(:,5); x0_1=A1(:,3); y100_1=A1(:,6);
% D1=load("/Users/hamid/piibamm/PyBaMM/UMBLFeb2022/Andrew_100DOD_experiment_feb142.mat");
D1=load("/Users/hamid/piibamm/PyBaMM/UMBLFeb2022/Andrew_100DOD_experiment_refit_resis13e5_Mar18.mat");


J6=readmatrix("/Users/hamid/piibamm/PyBaMM/GM2022/data/esoh_R/aging_param_cell_IRC_cell041.csv");
Cyc6=J6(2:end,1); Cap6=J6(2:end,8); Cp6=J6(2:end,7); Cn6=J6(2:end,6);y0_6=J6(2:end,3);
x100_6=J6(2:end,4); x0_6=J6(2:end,2); y100_6=J6(2:end,5);
D6=load("/Users/hamid/piibamm/PyBaMM/GM2022/cycling_aging/GMJuly_fit_DCFC_July25.mat");
%%
figure(322);

tiledlayout(3,4)




%%

nexttile
plot(Cyc4,(1-Cap4/Cap4(1))*100,"k-o",MarkerSize=3, linewidth=2);hold on;
plot(Cyc4(1)+D4.cycle_num,100*(1-D4.Cap/D4.Cap(1)),'--r', linewidth=2)
ylabel("C/20 capacity loss %");xlabel("cycle number");
ylim([0 30]); xlim([0 900])

nexttile
plot(Cyc4,(1-Cn4/Cn4(1))*100,"k-o",MarkerSize=3, linewidth=2);hold on;
% plot(Cyc4(1)+D4.cycle_num,100*(1-(Cn4(2)/Cn4(1)))+D4.LAM_N,'--r', linewidth=2)
plot(Cyc4(1)+D4.cycle_num,D4.LAM_N,'--r', linewidth=2)

ylabel("LAM Negative %");xlabel("cycle number");
ylim([0 30]); xlim([0 900])


nexttile
plot(Cyc4,(1-Cp4/Cp4(1))*100,"k-o",MarkerSize=3, linewidth=2); hold on;
% plot(Cyc4(1)+D4.cycle_num,100*(1-(Cp4(2)/Cp4(1)))+D4.LAM_P,'--r', linewidth=2)
plot(Cyc4(1)+D4.cycle_num,D4.LAM_P,'--r', linewidth=2)

ylabel("LAM positive %");xlabel("cycle number");
ylim([0 30]); xlim([0 900])

LLI4=1-(x100_4.*Cn4+y100_4.*Cp4)/(x100_4(1)*Cn4(1)+y100_4(1)*Cp4(1));

nexttile
plot(Cyc4,LLI4*100,"k-o",MarkerSize=3, linewidth=2);hold on;
plot(Cyc4(1)+D4.cycle_num,D4.LLI,'--r', linewidth=2)
ylabel("LLI %");xlabel("cycle number");
ylim([0 30]); xlim([0 900])


%%

nexttile
plot(Cyc6*4,(1-Cap6/Cap6(1))*100,"k-o",MarkerSize=3, linewidth=2);hold on;
plot(Cyc6(1)*4+D6.cycle_num*4,100*(1-D6.Cap/D6.Cap(1)),'--r', linewidth=2)
ylabel("C/20 capacity loss %");xlabel("cycle number");
ylim([0 30]); xlim([0 900])

nexttile
plot(Cyc6*4,(1-Cn6/Cn6(1))*100,"k-o",MarkerSize=3, linewidth=2);hold on;
% plot(Cyc4(1)+D4.cycle_num,100*(1-(Cn4(2)/Cn4(1)))+D4.LAM_N,'--r', linewidth=2)
plot(Cyc6(1)*4+D6.cycle_num*4,D6.LAM_N,'--r', linewidth=2)

ylabel("LAM Negative %");xlabel("cycle number");
ylim([0 30]); xlim([0 900])


nexttile
plot(Cyc6*4,(1-Cp6/Cp6(1))*100,"k-o",MarkerSize=3, linewidth=2); hold on;
% plot(Cyc6(1)+D6.cycle_num,100*(1-(Cp6(2)/Cp6(1)))+D6.LAM_P,'--r', linewidth=2)
plot(Cyc6(1)*4+D6.cycle_num*4,D6.LAM_P,'--r', linewidth=2)
ylabel("LAM positive %");xlabel("cycle number");
ylim([0 30]); xlim([0 900])

LLI6=1-(x100_6.*Cn6+y100_6.*Cp6)/(x100_6(1)*Cn6(1)+y100_6(1)*Cp6(1));

nexttile
plot(Cyc6*4,LLI6*100,"k-o",MarkerSize=3, linewidth=2);hold on;
plot(Cyc6(1)*4+D6.cycle_num*4,D6.LLI,'--r', linewidth=2)
ylabel("LLI %");xlabel("cycle number");
ylim([0 30]); xlim([0 900])

%% Andrew
nexttile
plot(Cyc1,(1-Cap1/Cap1(1))*100,"k-o",MarkerSize=3 ,linewidth=2); hold on;
plot(Cyc1(1)+D1.cycle_num,100*(1-D1.Cap/D1.Cap(1)),'--r', linewidth=2)
ylabel("C/20 capacity loss %");
ylim([0 30]); xlim([0 900])

nexttile
plot(Cyc1,(1-Cn1/Cn1(1))*100,"k-o",MarkerSize=3, linewidth=2);hold on;
plot(Cyc1(1)+D1.cycle_num,D1.LAM_N,'--r', linewidth=2)
ylabel("LAM Negative %");ylim([0 30]); xlim([0 900])



nexttile
plot(Cyc1,(1-Cp1/Cp1(1))*100, "k-o", linewidth=2,MarkerSize=3);hold on;
plot(Cyc1(1)+D1.cycle_num,D1.LAM_P,'--r', linewidth=2)
ylabel("LAM positive %"); ylim([0 30]); xlim([0 900])



LLI1=1-(x100_1.*Cn1+y100_1.*Cp1)/(x100_1(1)*Cn1(1)+y100_1(1)*Cp1(1));

nexttile
plot(Cyc1,LLI1*100,"k-o",MarkerSize=3, linewidth=2);hold on;
plot(Cyc1(1)+D1.cycle_num,D1.LLI,'--r', linewidth=2)
ylabel("LLI %"); ylim([0 30]); xlim([0 900])
