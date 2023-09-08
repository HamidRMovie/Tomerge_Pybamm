%%Comparison of loss metrics

close all
clear all

set(groot,'defaultAxesXGrid','on')
set(groot,'defaultAxesYGrid','on')


%%
P4=readmatrix("F:\Stefanapolu application\RC sys ID\Peyman2020\esoh\aging_param_cell_04.csv");
Cyc4=P4(:,1); Cap4=P4(:,9); Cp4=P4(:,8); Cn4=P4(:,7);y0_4=P4(:,4); x100_4=P4(:,5); x0_4=P4(:,3); y100_4=P4(:,6);
D4=load("F:\Git Hub rep\PyBaMM\V2G\plating\cell04_plating.mat");

A1=readmatrix("F:\Git Hub rep\PyBaMM\UMBLFeb 2022\data\esoh\aging_param_cell_152002.csv");
Cyc1=A1(:,1); Cap1=A1(:,9); Cp1=A1(:,8); Cn1=A1(:,7);y0_1=A1(:,4); x100_1=A1(:,5); x0_1=A1(:,3); y100_1=A1(:,6);
D1=load("F:\Git Hub rep\PyBaMM\UMBLFeb 2022\Andrew_100DOD_experiment_feb142.mat");
%%
figure(319);

tiledlayout(2,4)

nexttile
plot(Cyc1,(1-Cap1/Cap1(1))*100,"k-o",MarkerSize=3 ,linewidth=2); hold on;
plot(Cyc1(1)+D1.cycle_num,100*(1-D1.Cap/D1.Cap(1)),'--r', linewidth=2)
ylabel("C/20 capacity loss %");
ylim([0 40]); xlim([0 900])

nexttile
plot(Cyc1,(1-Cn1/Cn1(1))*100,"k-o",MarkerSize=3, linewidth=2);hold on;
plot(Cyc1(1)+D1.cycle_num,D1.LAM_N,'--r', linewidth=2)
ylabel("LAM Negative %");ylim([0 40]); xlim([0 900])



nexttile
plot(Cyc1,(1-Cp1/Cp1(1))*100, "k-o", linewidth=2,MarkerSize=3);hold on;
plot(Cyc1(1)+D1.cycle_num,D1.LAM_P,'--r', linewidth=2)
ylabel("LAM positive %"); ylim([0 40]); xlim([0 900])



LLI1=1-(x100_1.*Cn1+y100_1.*Cp1)/(x100_1(1)*Cn1(1)+y100_1(1)*Cp1(1));

nexttile
plot(Cyc1,LLI1*100,"k-o",MarkerSize=3, linewidth=2);hold on;
plot(Cyc1(1)+D1.cycle_num,D1.LLI,'--r', linewidth=2)
ylabel("LLI %"); ylim([0 40]); xlim([0 900])



%%

nexttile
plot(Cyc4,(1-Cap4/Cap4(1))*100,"k-o",MarkerSize=3, linewidth=2);hold on;
plot(Cyc4(2)+D4.cycle_num,100*(1-D4.Cap/D4.Cap(1)),'--r', linewidth=2)
ylabel("C/20 capacity loss %");xlabel("cycle number");
ylim([0 40]); xlim([0 900])

nexttile
plot(Cyc4,(1-Cn4/Cn4(1))*100,"k-o",MarkerSize=3, linewidth=2);hold on;
plot(Cyc4(2)+D4.cycle_num,100*(1-(Cn4(2)/Cn4(1)))+D4.LAM_N,'--r', linewidth=2)
ylabel("LAM Negative %");xlabel("cycle number");
ylim([0 40]); xlim([0 900])


nexttile
plot(Cyc4,(1-Cp4/Cp4(1))*100,"k-o",MarkerSize=3, linewidth=2); hold on;
plot(Cyc4(2)+D4.cycle_num,100*(1-(Cp4(2)/Cp4(1)))+D4.LAM_P,'--r', linewidth=2)
ylabel("LAM positive %");xlabel("cycle number");
ylim([0 40]); xlim([0 900])

LLI4=1-(x100_4.*Cn4+y100_4.*Cp4)/(x100_4(1)*Cn4(1)+y100_4(1)*Cp4(1));

nexttile
plot(Cyc4,LLI4*100,"k-o",MarkerSize=3, linewidth=2);hold on;
plot(Cyc4(2)+D4.cycle_num,D4.LLI,'--r', linewidth=2)
ylabel("LLI %");xlabel("cycle number");
ylim([0 40]); xlim([0 900])

