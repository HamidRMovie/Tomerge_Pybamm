%
clear all
close all

% A=load("F:\Git Hub rep\PyBaMM\UMBLFeb2022\Andrew_100DOD_experiment_feb142.mat");
% A=load("F:\Git Hub rep\PyBaMM\UMBLFeb2022\Andrew_100DOD_experiment_C50CV_Mar2_3.mat");
% A=load("F:\Git Hub rep\PyBaMM\UMBLFeb2022\Andrew_100DOD_experiment_C50CV_Mar6_1.mat");


% A=load("F:\Git Hub rep\PyBaMM\UMBLFeb2022\Andrew_100DOD_experiment_epe_03_Mar9.mat");% resis 1e6

A=load("F:\Git Hub rep\PyBaMM\UMBLFeb2022\Andrew_100DOD_experiment_refit_resis13e5_Mar18.mat");% resis 1.3e6
A3=load("F:\Git Hub rep\PyBaMM\UMBLFeb2022\Andrew_100DOD_experiment_epe_03_Mar9_3.mat"); % resis 1.5e6


B=readmatrix("F:\Git Hub rep\PyBaMM\UMBLFeb2022\data\UMBL2022FEB_CELL152002_cycling_data.csv");

t2=B(:,1); I2=-B(:,2)/1000; V2=B(:,3); cyc2=B(:,8);

%%
colorlist2=["b","r","g"];

figure(180); hold on
tiledlayout(2,3)

% BOL
nexttile
hold on;
t3=t2(cyc2==40)/60;
plot(t3-t3(1)+2,V2(cyc2==40),"-r",  'LineWidth',2 )

t1=A.t(A.t<=A.cycle_time(1))/60 ;

plot(t1-t1(1)-1,A.Vt_t(A.t<=A.cycle_time(1)),"-.b",  'LineWidth',2)
hold on;
t1=A3.t(A3.t<=A3.cycle_time(1))/60 ;
plot(t1-t1(1)-2,A3.Vt_t(A3.t<=A3.cycle_time(1)),"-.g",  'LineWidth',2)
title("BOL")
xlim([0, 160])
%MOL
nexttile
hold on;
t3=t2(cyc2==640)/60;
plot(t3-t3(1),V2(cyc2==640),"-r",  'LineWidth',2 )

t1=A.t(A.t<=A.cycle_time(440) & A.t>=A.cycle_time(439))/60 ;

plot(t1-t1(1)-7,A.Vt_t(A.t<=A.cycle_time(440) & A.t>=A.cycle_time(439)),"-.b",  'LineWidth',2)
hold on;
t1=A3.t(A3.t<=A3.cycle_time(440) & A3.t>=A3.cycle_time(439))/60 ;
plot(t1-t1(1)-11,A3.Vt_t(A3.t<=A3.cycle_time(440) & A3.t>=A3.cycle_time(439)),"-.g",  'LineWidth',2)
title("MOL")
xlim([-5, 160])

%EOL
nexttile
hold on;
t3=t2(cyc2==1279 )/60;
plot(t3-t3(1),V2(cyc2==1279 ),"-r",  'LineWidth',2 )

t1=A.t(A.t<=A.cycle_time(880) & A.t>=A.cycle_time(879))/60 ;
plot(t1-t1(1)-6,A.Vt_t(A.t<=A.cycle_time(880) & A.t>=A.cycle_time(879)),"-.b",  'LineWidth',2)
hold on;
t1=A3.t(A3.t<=A3.cycle_time(880) & A3.t>=A3.cycle_time(879))/60 ;
plot(t1-t1(1)-14,A3.Vt_t(A3.t<=A3.cycle_time(880) & A3.t>=A3.cycle_time(879)),"-.g",  'LineWidth',2)
title("EOL")
xlim([-10, 160])

legend("data","Resist_{SEI} =1.3e6 \Omega m", "Resist_{SEI} =1.5e6 \Omega m")



%%
nexttile
t3=t2(cyc2==40)/60;
plot(t3-t3(1)+2,I2(cyc2==40),"-r",  'LineWidth',2 )
hold on;

t1=A.t(A.t<=A.cycle_time(1))/60 ;
plot(t1-t1(1)-1,A.I(A.t<=A.cycle_time(1)),"-.b",  'LineWidth',2)
hold on;
t1=A3.t(A3.t<=A3.cycle_time(1))/60 ;
plot(t1-t1(1)-2,A3.I(A3.t<=A3.cycle_time(1)),"-.g",  'LineWidth',2)


xlim([0, 160])

%MOL
nexttile
t3=t2(cyc2==640)/60;
plot(t3-t3(1),I2(cyc2==640),"-r",  'LineWidth',2 )
hold on;

t1=A.t(A.t<=A.cycle_time(440) & A.t>=A.cycle_time(439))/60 ;
plot(t1-t1(1)-7,A.I(A.t<=A.cycle_time(440) & A.t>=A.cycle_time(439)),"-.b",  'LineWidth',2)
hold on;
t1=A3.t(A3.t<=A3.cycle_time(440) & A3.t>=A3.cycle_time(439))/60 ;
plot(t1-t1(1)-11,A3.I(A3.t<=A3.cycle_time(440) & A3.t>=A3.cycle_time(439)),"-.g",  'LineWidth',2)

xlim([-5, 160])

%EOL
nexttile
t3=t2(cyc2==1280)/60;
plot(t3-t3(1),I2(cyc2==1280 ),"-r",  'LineWidth',2 )
hold on;
t1=A.t(A.t<=A.cycle_time(880) & A.t>=A.cycle_time(879)) /60;
plot(t1-t1(1)-6,A.I(A.t<=A.cycle_time(880) & A.t>=A.cycle_time(879)),"-.b",  'LineWidth',2)
hold on;

t1=A3.t(A3.t<=A3.cycle_time(880) & A3.t>=A3.cycle_time(879)) /60;
plot(t1-t1(1)-14,A3.I(A3.t<=A3.cycle_time(880) & A3.t>=A3.cycle_time(879)),"-.g",  'LineWidth',2)

xlim([-10, 160])

xlabel("Time(s)"); ylabel("Termial Voltage (V)")

%% Comparison of loss metrics

Data1=readmatrix("F:\Git Hub rep\PyBaMM\UMBLFeb2022\data\esoh\aging_param_cell_152002.csv");
Cyc1=Data1(:,1); Cap1=Data1(:,9); Cp1=Data1(:,8); Cn1=Data1(:,7);y0_1=Data1(:,4); x100_1=Data1(:,5); x0_1=Data1(:,3); y100_1=Data1(:,6);
D1=A;
D3=A3;


figure(319);

tiledlayout(1,4)

nexttile
plot(Cyc1,(1-Cap1/Cap1(1))*100,"r-o",MarkerSize=3 ,linewidth=2); hold on;
plot(Cyc1(1)+D1.cycle_num,100*(1-D1.Cap/D1.Cap(1)),'-.b', linewidth=2)
plot(Cyc1(1)+D3.cycle_num,100*(1-D3.Cap/D3.Cap(1)),'--g', linewidth=2)
xlabel("cycle")

ylabel("C/20 capacity loss %");
ylim([0 25]); xlim([0 900])

nexttile
plot(Cyc1,(1-Cn1/Cn1(1))*100,"r-o",MarkerSize=3, linewidth=2);hold on;
plot(Cyc1(1)+D1.cycle_num,D1.LAM_N,'-.b', linewidth=2)
plot(Cyc1(1)+D3.cycle_num,D3.LAM_N,'--g', linewidth=2)

ylabel("LAM Negative %");ylim([0 25]); xlim([0 900])



nexttile
plot(Cyc1,(1-Cp1/Cp1(1))*100, "r-o", linewidth=2,MarkerSize=3);hold on;
plot(Cyc1(1)+D1.cycle_num,D1.LAM_P,'-.b', linewidth=2)
plot(Cyc1(1)+D3.cycle_num,D3.LAM_P,'--g', linewidth=2)

ylabel("LAM positive %"); ylim([0 25]); xlim([0 900])



LLI1=1-(x100_1.*Cn1+y100_1.*Cp1)/(x100_1(1)*Cn1(1)+y100_1(1)*Cp1(1));

nexttile
plot(Cyc1,LLI1*100,"r-o",MarkerSize=3, linewidth=2);hold on;
plot(Cyc1(1)+D1.cycle_num,D1.LLI,'-.b', linewidth=2)
plot(Cyc1(1)+D3.cycle_num,D3.LLI,'--g', linewidth=2)

ylabel("LLI %"); ylim([0 25]); xlim([0 900])
legend("data","Resist_{SEI} =1.3e6 \Omega m", "Resist_{SEI} =1.5e6 \Omega m")









%}
