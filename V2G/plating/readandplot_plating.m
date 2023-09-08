clear all
close all

set(groot,'defaultAxesXGrid','on')
set(groot,'defaultAxesYGrid','on')
%% load Peyman's esoh results 
P1=readmatrix("F:\Stefanapolu application\RC sys ID\Peyman2020\esoh\aging_param_cell_01.csv");
Cyc1=P1(:,1); Cap1=P1(:,9); Cp1=P1(:,8); Cn1=P1(:,7); y0_1=P1(:,4); x100_1=P1(:,5); x0_1=P1(:,3); y100_1=P1(:,6);
P4=readmatrix("F:\Stefanapolu application\RC sys ID\Peyman2020\esoh\aging_param_cell_04.csv");
Cyc4=P4(:,1); Cap4=P4(:,9); Cp4=P4(:,8); Cn4=P4(:,7);y0_4=P4(:,4); x100_4=P4(:,5); x0_4=P4(:,3); y100_4=P4(:,6);
P7=readmatrix("F:\Stefanapolu application\RC sys ID\Peyman2020\esoh\aging_param_cell_07.csv");
Cyc7=P7(:,1); Cap7=P7(:,9); Cp7=P7(:,8); Cn7=P7(:,7); y0_7=P7(:,4); x100_7=P7(:,5); x0_7=P7(:,3); y100_7=P7(:,6);

P19=readmatrix("F:\Stefanapolu application\RC sys ID\Peyman2020\esoh\aging_param_cell_19.csv");
Cyc19=P19(:,1); Cap19=P19(:,9); Cp19=P19(:,8); Cn19=P19(:,7); y0_19=P19(:,4); x100_19=P19(:,5); x0_19=P19(:,3); y100_19=P19(:,6);

%% Load Peyman's cycling data
D1=readmatrix("F:\Stefanapolu application\RC sys ID\Peyman2020\cycling\cycling_data_cell_01.csv");
D1_t=D1(:,1); D1_V=D1(:,3); D1_cyc=D1(:,8); D1_I=-D1(:,2)/1000;

D4=readmatrix("F:\Stefanapolu application\RC sys ID\Peyman2020\cycling\cycling_data_cell_04.csv");
D4_t=D4(:,1); D4_V=D4(:,3); D4_cyc=D4(:,8); D4_I=-D4(:,2)/1000;

D7=readmatrix("F:\Stefanapolu application\RC sys ID\Peyman2020\cycling\cycling_data_cell_07.csv");
D7_t=D7(:,1); D7_V=D7(:,3); D7_cyc=D7(:,8); D7_I=-D7(:,2)/1000;

D19=readmatrix("F:\Stefanapolu application\RC sys ID\Peyman2020\cycling\cycling_data_cell_19.csv");
D19_t=D19(:,1); D19_V=D19(:,3); D19_cyc=D19(:,8); D19_I=-D19(:,2)/1000;





%%  Read simulation
A1=load("F:\Git Hub rep\PyBaMM\V2G\plating\cell01_plating_jan19.mat");
A4=load("F:\Git Hub rep\PyBaMM\V2G\plating\cell04_plating_jan19.mat");
A7=load("F:\Git Hub rep\PyBaMM\V2G\plating\cell07_plating_jan19.mat");
A19=load("F:\Git Hub rep\PyBaMM\V2G\plating\cell19_plating_jan25_cond1.mat");
A190=load("F:\Git Hub rep\PyBaMM\V2G\plating\cell19_plating_jan25_cond5.mat");



B1=load("F:\Git Hub rep\PyBaMM\V2G\plating\cell01_plating.mat");
B4=load("F:\Git Hub rep\PyBaMM\V2G\plating\cell04_plating.mat");
B7=load("F:\Git Hub rep\PyBaMM\V2G\plating\cell07_plating.mat");



%%

figure(1); hold on; 
plot(Cyc1(2)+A1.cycle_num,A1.Cap,":b",LineWidth=2);
plot(Cyc1,Cap1,"*b",LineWidth=2)
plot(Cyc4(2)+A4.cycle_num,A4.Cap,":r",LineWidth=2);
plot(Cyc4,Cap4,"*r",LineWidth=2)
plot(Cyc7(2)+A7.cycle_num,A7.Cap,":k",LineWidth=2);
plot(Cyc7,Cap7,"*k",LineWidth=2)

plot(Cyc1(2)+B1.cycle_num,B1.Cap,"--b",LineWidth=2);
plot(Cyc4(2)+B4.cycle_num,B4.Cap,"--r",LineWidth=2);
plot(Cyc7(2)+B7.cycle_num,B7.Cap,"--k",LineWidth=2);

legend("C/5 Simulation", "C/5 data","1.5C Simulation", "1.5C data", "2C Simulation", "2C data")
ylabel("Capacity"); xlabel("Cycle number")




%% Cp Cn
figure(12); 
plot(Cyc1(2)+ A1.cycle_num, A1.C_Neg,"b",LineWidth=2); hold on;
plot(Cyc4(2)+A4.cycle_num, A4.C_Neg,"r",LineWidth=2);
plot(Cyc7(2)+A7.cycle_num, A7.C_Neg,"k",LineWidth=2);
plot(Cyc1,Cn1,"*b",LineWidth=2);
plot(Cyc4,Cn4,"*r",LineWidth=2);
plot(Cyc7,Cn7,"*k",LineWidth=2);
ylabel("C_n"); xlabel("Cycle number")
legend("C/5 Simulation","1.5C Simulation", "2C Simulation",  "C/5 data", "1.5C data","2C data")

plot(Cyc1(2)+ B1.cycle_num, B1.C_Neg,"--b",LineWidth=2); hold on;
plot(Cyc4(2)+B4.cycle_num, B4.C_Neg,"--r",LineWidth=2);
plot(Cyc7(2)+B7.cycle_num, B7.C_Neg,"--k",LineWidth=2);



figure(13); 
plot(Cyc1(2)+ A1.cycle_num, A1.C_pos,"b",LineWidth=2); hold on;
plot(Cyc4(2)+A4.cycle_num, A4.C_pos,"r",LineWidth=2);
plot(Cyc7(2)+A7.cycle_num,A7.C_pos,"k",LineWidth=2);
plot(Cyc1,Cp1,"*b",LineWidth=2);
plot(Cyc4,Cp4,"*r",LineWidth=2);
plot(Cyc7,Cp7,"*k",LineWidth=2);
ylabel("C_p"); xlabel("Cycle number")
legend("C/5 Simulation","1.5C Simulation", "2C Simulation",  "C/5 data", "1.5C data","2C data")
plot(Cyc1(2)+ B1.cycle_num, B1.C_pos,"--b",LineWidth=2); hold on;
plot(Cyc4(2)+B4.cycle_num, B4.C_pos,"--r",LineWidth=2);
plot(Cyc7(2)+B7.cycle_num,B7.C_pos,"--k",LineWidth=2);





%% Stoch x y
figure(15); 
plot(Cyc1(2)+ A1.cycle_num, A1.x100,"b",LineWidth=2); hold on;
plot(Cyc4(2)+A4.cycle_num, A4.x100,"r",LineWidth=2);
plot(Cyc7(2)+A7.cycle_num, A7.x100,"k",LineWidth=2);
plot(Cyc1,x100_1,"*b",LineWidth=2);
plot(Cyc4,x100_4,"*r",LineWidth=2);
plot(Cyc7,x100_7,"*k",LineWidth=2);

plot(Cyc1(2)+ A1.cycle_num, A1.x0,"b",LineWidth=2); hold on;
plot(Cyc4(2)+A4.cycle_num, A4.x0,"r",LineWidth=2);
plot(Cyc7(2)+A7.cycle_num, A7.x0,"k",LineWidth=2);
plot(Cyc1,x0_1,"*b",LineWidth=2);
plot(Cyc4,x0_4,"*r",LineWidth=2);
plot(Cyc7,x0_7,"*k",LineWidth=2);
ylabel("x"); xlabel("Cycle number")
legend("C/5 Simulation","1.5C Simulation", "2C Simulation",  "C/5 data", "1.5C data","2C data")


figure(16); 
plot(Cyc1(2)+ A1.cycle_num, A1.y100,"b",LineWidth=2); hold on;
plot(Cyc4(2)+A4.cycle_num, A4.y100,"r",LineWidth=2);
plot(Cyc7(2)+A7.cycle_num, A7.y100,"k",LineWidth=2);
plot(Cyc1,y100_1,"*b",LineWidth=2);
plot(Cyc4,y100_4,"*r",LineWidth=2);
plot(Cyc7,y100_7,"*k",LineWidth=2);

plot(Cyc1(2)+ A1.cycle_num, A1.y0,"b",LineWidth=2); hold on;
plot(Cyc4(2)+A4.cycle_num, A4.y0,"r",LineWidth=2);
plot(Cyc7(2)+A7.cycle_num, A7.y0,"k",LineWidth=2);
plot(Cyc1,y0_1,"*b",LineWidth=2);
plot(Cyc4,y0_4,"*r",LineWidth=2);
plot(Cyc7,y0_7,"*k",LineWidth=2);
ylabel("y"); xlabel("Cycle number")
legend("C/5 Simulation","1.5C Simulation", "2C Simulation",  "C/5 data", "1.5C data","2C data")

%% LANM LLI

figure(18)
hold on;
plot(Cyc1(2)+A1.cycle_num,100*(1-(Cn1(2)/Cn1(1)))+A1.LAM_N,'b', linewidth=2)
hold on; plot(Cyc1,100*(1-(Cn1/Cn1(1))),"*b", LineWidth=2)
plot(Cyc4(2)+A4.cycle_num,100*(1-(Cn4(2)/Cn4(1)))+A4.LAM_N,'r', linewidth=2)
hold on; plot(Cyc4,100*(1-(Cn4/Cn4(1))),"*r", LineWidth=2)
plot(Cyc7(2)+A7.cycle_num,100*(1-(Cn7(2)/Cn7(1)))+A7.LAM_N,'k', linewidth=2)
hold on; plot(Cyc7,100*(1-(Cn7/Cn7(1))),"*k", LineWidth=2)
xlabel("cycle number",'FontSize',15); ylabel("LAM_{Neg}",'FontSize',15);
legend("C/5 Simulation", "C/5 data","1.5C Simulation", "1.5C data", "2C Simulation", "2C data")

figure(182)
hold on;
plot(Cyc1(2)+A1.cycle_num,100*(1-(Cp1(2)/Cp1(1)))+A1.LAM_P,'b', linewidth=2)
hold on; plot(Cyc1,100*(1-(Cp1/Cp1(1))),"*b", LineWidth=2)
plot(Cyc4(2)+A4.cycle_num,100*(1-(Cp4(2)/Cp4(1)))+A4.LAM_P,'r', linewidth=2)
hold on; plot(Cyc4,100*(1-(Cp4/Cp4(1))),"*r", LineWidth=2)
plot(Cyc7(2)+A7.cycle_num,100*(1-(Cp7(2)/Cp7(1)))+A7.LAM_P,'k', linewidth=2)
hold on; plot(Cyc7,100*(1-(Cp7/Cp7(1))),"*k", LineWidth=2)
xlabel("cycle number",'FontSize',15); ylabel("LAM_{Pos}",'FontSize',15);
legend("Simulation","Mohtat 2020 data")
legend("C/5 Simulation", "C/5 data","1.5C Simulation", "1.5C data", "2C Simulation", "2C data")


figure(19)
hold on;
LLI1=100*(1-Cn1.*(x100_1-x0_1)/Cn1(1)/(x100_1(1)-x0_1(1)));
LLI1_2=100*(1-(Cn1.*(x100_1)+Cp1.*y100_1)/(Cn1(1)*x100_1(1)+Cp1(1)*y100_1(1)));


plot(Cyc1(2)+A1.cycle_num,LLI1(2)+A1.LLI,'b', linewidth=2); 
hold on; plot(Cyc1,LLI1,"*b", LineWidth=2);
LLI4=100*(1-Cn4.*(x100_4-x0_4)/Cn4(1)/(x100_4(1)-x0_4(1)));
plot(Cyc4(2)+A4.cycle_num,LLI4(2)+A4.LLI,'r', linewidth=2)
hold on; plot(Cyc4,LLI4,"*r", LineWidth=2);

LLI7=100*(1-Cn7.*(x100_7-x0_7)/Cn7(1)/(x100_7(1)-x0_7(1)));
LLI7_2=100*(1-(Cn7.*(x100_7)+Cp7.*y100_7)/(Cn7(1)*x100_7(1)+Cp7(1)*y100_7(1)));




plot(Cyc7(2)+A7.cycle_num,LLI7(2)+A7.LLI,'k', linewidth=2)
hold on; plot(Cyc7,LLI7,"*k", LineWidth=2);

xlabel("cycle number",'FontSize',15); ylabel("LLI[%]",'FontSize',15);
legend("C/5 Simulation", "C/5 data","1.5C Simulation", "1.5C data", "2C Simulation", "2C data")

figure(263); plot(LLI7); hold on; plot(LLI7_2)

%% BOL MOL EOL C/5
figure(21);
tiledlayout(2,3)

nexttile
cycle_number_toplot=1;
Cycle_length=A1.cycle_time(cycle_number_toplot+1)-A1.cycle_time(cycle_number_toplot);
stp=A1.cycle_time(cycle_number_toplot)-Cycle_length/2-500; etp=stp+Cycle_length+300;
plot((A1.t(A1.t>stp & A1.t<etp)-stp)/60, A1.Vt_t(A1.t>stp & A1.t<etp), linewidth=2);
time_plot=D1_t(D1_cyc==1);
hold on; plot((time_plot-time_plot(1)+100)/60,D1_V(D1_cyc==1), linewidth=2)
title ("BOL")
% MOL
nexttile
cycle_number_toplot=170;
Cycle_length=A1.cycle_time(cycle_number_toplot+1)-A1.cycle_time(cycle_number_toplot);
stp=A1.cycle_time(cycle_number_toplot)-Cycle_length/2-500; etp=stp+Cycle_length+200;
plot((A1.t(A1.t>stp & A1.t<etp)-stp)/60, A1.Vt_t(A1.t>stp & A1.t<etp), linewidth=2);
time_plot=D1_t(D1_cyc==170);
hold on; plot((time_plot-time_plot(1)+10)/60,D1_V(D1_cyc==170), linewidth=2)
title("MOL")
% EOL0
nexttile
cycle_number_toplot=335;
Cycle_length=A1.cycle_time(cycle_number_toplot+1)-A1.cycle_time(cycle_number_toplot);
stp=A1.cycle_time(cycle_number_toplot)-Cycle_length/2-800; etp=stp+Cycle_length+500;
plot((A1.t(A1.t>stp & A1.t<etp)-stp)/60, A1.Vt_t(A1.t>stp & A1.t<etp), linewidth=2);
time_plot=D1_t(D1_cyc==335);
hold on; plot((time_plot-time_plot(1)+200)/60,D1_V(D1_cyc==335), linewidth=2)
title("EOL")

nexttile
cycle_number_toplot=1;
Cycle_length=A1.cycle_time(cycle_number_toplot+1)-A1.cycle_time(cycle_number_toplot);
stp=A1.cycle_time(cycle_number_toplot)-Cycle_length/2-500; etp=stp+Cycle_length+300;
plot((A1.t(A1.t>stp & A1.t<etp)-stp)/60, A1.I(A1.t>stp & A1.t<etp)/5, linewidth=2);
time_plot=D1_t(D1_cyc==1);
hold on; plot((time_plot-time_plot(1)+100)/60,D1_I(D1_cyc==1)/5, linewidth=2)

nexttile
cycle_number_toplot=170;
Cycle_length=A1.cycle_time(cycle_number_toplot+1)-A1.cycle_time(cycle_number_toplot);
stp=A1.cycle_time(cycle_number_toplot)-Cycle_length/2-500; etp=stp+Cycle_length+200;
plot((A1.t(A1.t>stp & A1.t<etp)-stp)/60, A1.I(A1.t>stp & A1.t<etp)/5, linewidth=2);
time_plot=D1_t(D1_cyc==170);
hold on; plot((time_plot-time_plot(1)+10)/60,D1_I(D1_cyc==170)/5, linewidth=2)


nexttile
cycle_number_toplot=335;
Cycle_length=A1.cycle_time(cycle_number_toplot+1)-A1.cycle_time(cycle_number_toplot);
stp=A1.cycle_time(cycle_number_toplot)-Cycle_length/2-800; etp=stp+Cycle_length+400;
plot((A1.t(A1.t>stp & A1.t<etp)-stp)/60, A1.I(A1.t>stp & A1.t<etp)/5, linewidth=2);
time_plot=D1_t(D1_cyc==335);
hold on; plot((time_plot-time_plot(1)+200)/60,D1_I(D1_cyc==335)/5, linewidth=2)



Padding = 'compact';
TileSpacing = 'compact';

%% 1.5C
figure(120);
tiledlayout(2,3)

nexttile
cycle_number_toplot=1;
Cycle_length=A4.cycle_time(cycle_number_toplot+1)-A4.cycle_time(cycle_number_toplot);
stp=A4.cycle_time(cycle_number_toplot)-Cycle_length/2-650; etp=stp+Cycle_length+250;
plot((A4.t(A4.t>stp & A4.t<etp)-stp)/60, A4.Vt_t(A4.t>stp & A4.t<etp), linewidth=2);
time_plot=D4_t(D4_cyc==1);
hold on; plot((time_plot-time_plot(1)+100)/60,D4_V(D4_cyc==1), linewidth=2)
title ("BOL")

% MOL
nexttile
cycle_number_toplot=140;
Cycle_length=A4.cycle_time(cycle_number_toplot+1)-A4.cycle_time(cycle_number_toplot);
stp=A4.cycle_time(cycle_number_toplot)-Cycle_length/2-600; etp=stp+Cycle_length+150;
plot((A4.t(A4.t>stp & A4.t<etp)-stp)/60, A4.Vt_t(A4.t>stp & A4.t<etp), linewidth=2);
time_plot=D4_t(D4_cyc==140);
hold on; plot((time_plot-time_plot(1)+60)/60,D4_V(D4_cyc==140), linewidth=2)
title ("MOL")



% EOL

nexttile
cycle_number_toplot=285;
Cycle_length=A4.cycle_time(cycle_number_toplot+1)-A4.cycle_time(cycle_number_toplot);
stp=A4.cycle_time(cycle_number_toplot)-Cycle_length/2-700; etp=stp+Cycle_length+200;
plot((A4.t(A4.t>stp & A4.t<etp)-stp)/60, A4.Vt_t(A4.t>stp & A4.t<etp), linewidth=2);
time_plot=D4_t(D4_cyc==285);
hold on; plot((time_plot-time_plot(1)+60)/60,D4_V(D4_cyc==285), linewidth=2)
title ("EOL")



nexttile
cycle_number_toplot=1;
Cycle_length=A4.cycle_time(cycle_number_toplot+1)-A4.cycle_time(cycle_number_toplot);
stp=A4.cycle_time(cycle_number_toplot)-Cycle_length/2-650; etp=stp+Cycle_length+200;
plot((A4.t(A4.t>stp & A4.t<etp)-stp)/60, A4.I(A4.t>stp & A4.t<etp)/5, linewidth=2);
time_plot=D4_t(D4_cyc==1);
hold on; plot((time_plot-time_plot(1)+100)/60,D4_I(D4_cyc==1)/5, linewidth=2)



nexttile
cycle_number_toplot=140;
Cycle_length=A4.cycle_time(cycle_number_toplot+1)-A4.cycle_time(cycle_number_toplot);
stp=A4.cycle_time(cycle_number_toplot)-Cycle_length/2-600; etp=stp+Cycle_length+75;
plot((A4.t(A4.t>stp & A4.t<etp)-stp)/60, A4.I(A4.t>stp & A4.t<etp)/5, linewidth=2);
time_plot=D4_t(D4_cyc==140);
hold on; plot((time_plot-time_plot(1)+60)/60,D4_I(D4_cyc==140)/5, linewidth=2)


nexttile
cycle_number_toplot=140;
Cycle_length=A4.cycle_time(cycle_number_toplot+1)-A4.cycle_time(cycle_number_toplot);
stp=A4.cycle_time(cycle_number_toplot)-Cycle_length/2-600; etp=stp+Cycle_length+75;
plot((A4.t(A4.t>stp & A4.t<etp)-stp)/60, A4.I(A4.t>stp & A4.t<etp)/5, linewidth=2);
time_plot=D4_t(D4_cyc==140);
hold on; plot((time_plot-time_plot(1)+60)/60,D4_I(D4_cyc==140)/5, linewidth=2)


%% 2C
figure(220);
tiledlayout(2,3)

nexttile
cycle_number_toplot=1;
Cycle_length=A7.cycle_time(cycle_number_toplot+1)-A7.cycle_time(cycle_number_toplot);
stp=A7.cycle_time(cycle_number_toplot)-Cycle_length/2-600; etp=stp+Cycle_length+85;
 plot((A7.t(A7.t>stp & A7.t<etp)-stp)/60, A7.Vt_t(A7.t>stp & A7.t<etp), linewidth=2);
time_plot=D7_t(D7_cyc==1);
hold on; plot((time_plot-time_plot(1)+50)/60,D7_V(D7_cyc==1), linewidth=2)
title ("BOL")

% MOL
nexttile
cycle_number_toplot=100;
Cycle_length=A7.cycle_time(cycle_number_toplot+1)-A7.cycle_time(cycle_number_toplot);
stp=A7.cycle_time(cycle_number_toplot)-Cycle_length/2-650; etp=stp+Cycle_length+75;
plot((A7.t(A7.t>stp & A7.t<etp)-stp)/60, A7.Vt_t(A7.t>stp & A7.t<etp), linewidth=2);
time_plot=D7_t(D7_cyc==100);
hold on; plot((time_plot-time_plot(1)+50)/60,D7_V(D7_cyc==100), linewidth=2)
title ("MOL")

% EOL0
nexttile
cycle_number_toplot=200;
Cycle_length=A7.cycle_time(cycle_number_toplot+1)-A7.cycle_time(cycle_number_toplot);
stp=A7.cycle_time(cycle_number_toplot)-Cycle_length/2-700; etp=stp+Cycle_length+75;
plot((A7.t(A7.t>stp & A7.t<etp)-stp)/60, A7.Vt_t(A7.t>stp & A7.t<etp), linewidth=2);
time_plot=D7_t(D7_cyc==200);
hold on; plot((time_plot-time_plot(1)+50)/60,D7_V(D7_cyc==200), linewidth=2)
title ("EOL")


nexttile
cycle_number_toplot=1;
Cycle_length=A7.cycle_time(cycle_number_toplot+1)-A7.cycle_time(cycle_number_toplot);
stp=A7.cycle_time(cycle_number_toplot)-Cycle_length/2-600; etp=stp+Cycle_length+85;
 plot((A7.t(A7.t>stp & A7.t<etp)-stp)/60, A7.I(A7.t>stp & A7.t<etp)/5, linewidth=2);
time_plot=D7_t(D7_cyc==1);
hold on; plot((time_plot-time_plot(1)+50)/60,D7_I(D7_cyc==1)/5, linewidth=2)
title ("BOL")

nexttile
cycle_number_toplot=100;
Cycle_length=A7.cycle_time(cycle_number_toplot+1)-A7.cycle_time(cycle_number_toplot);
stp=A7.cycle_time(cycle_number_toplot)-Cycle_length/2-650; etp=stp+Cycle_length+250;
plot((A7.t(A7.t>stp & A7.t<etp)-stp)/60, A7.I(A7.t>stp & A7.t<etp)/5, linewidth=2);
time_plot=D7_t(D7_cyc==100);
hold on; plot((time_plot-time_plot(1)+50)/60,D7_I(D7_cyc==100)/5, linewidth=2)

nexttile
cycle_number_toplot=200;
Cycle_length=A7.cycle_time(cycle_number_toplot+1)-A7.cycle_time(cycle_number_toplot);
stp=A7.cycle_time(cycle_number_toplot)-Cycle_length/2-700; etp=stp+Cycle_length+250;
plot((A7.t(A7.t>stp & A7.t<etp)-stp)/60, A7.I(A7.t>stp & A7.t<etp)/5, linewidth=2);
time_plot=D7_t(D7_cyc==200);
hold on; plot((time_plot-time_plot(1)+50)/60,D7_I(D7_cyc==200)/5, linewidth=2)
title ("EOL")


%}
%% Cell 19
figure(401); hold on;
plot(Cyc19(2)+A19.cycle_num,A19.Cap,"b",LineWidth=2);
plot(Cyc19(2)+A190.cycle_num,A190.Cap,"r",LineWidth=2);
plot(Cyc19,Cap19,"*b",LineWidth=2)
title("Capacity"); xlabel("cycle")
legend("Sim based on C/5 & 1.5C fit", "Sim based on C/5 & 1.5C & mixed rate fit", "Experiment"); 

figure(402); hold on;
plot(Cyc19(2)+A19.cycle_num,A19.C_pos,"b",LineWidth=2);
plot(Cyc19(2)+A190.cycle_num,A190.C_pos,"r",LineWidth=2);
plot(Cyc19,Cp19,"*b",LineWidth=2)
title("Cp"); xlabel("cycle")


figure(403); hold on;
plot(Cyc19(2)+A19.cycle_num,A19.C_Neg,"b",LineWidth=2);
plot(Cyc19(2)+A190.cycle_num,A190.C_Neg,"r",LineWidth=2);
plot(Cyc19,Cn19,"*b",LineWidth=2)
title("Cn"); xlabel("cycle")

figure(404); hold on;
plot(Cyc19(2)+A19.cycle_num,A19.x100,"b",LineWidth=2);
plot(Cyc19(2)+A190.cycle_num,A190.x100,"r",LineWidth=2);
plot(Cyc19,x100_19,"*b",LineWidth=2)
title("x100"); xlabel("cycle")
legend("Sim based on C/5 & 1.5C fit", "Sim based on C/5 & 1.5C $ mixed rate fit", "Experiment"); 

figure(405); hold on;
plot(Cyc19(2)+A19.cycle_num,A19.y0,"b",LineWidth=2);
plot(Cyc19(2)+A190.cycle_num,A190.y0,"r",LineWidth=2);
plot(Cyc19,y0_19,"*b",LineWidth=2)
title("y0"); xlabel("cycle")

%%
figure(319);
tiledlayout(2,3)

%BOL
nexttile
cycle_number_toplot=2;
Cycle_length=A19.cycle_time(cycle_number_toplot+1)-A19.cycle_time(cycle_number_toplot); %sim
stp=A19.cycle_time(cycle_number_toplot)-Cycle_length/2+2550; etp=stp+Cycle_length+250;
plot((A19.t(A19.t>stp & A19.t<etp)-stp)/60, A19.Vt_t(A19.t>stp & A19.t<etp), linewidth=2);
time_plot=D19_t(D19_cyc==2);
hold on; plot((time_plot-time_plot(1)+100)/60,D19_V(D19_cyc==2), linewidth=2)
title ("BOL"); 
legend("Sim based on C/5 & 1.5C fit","Experiment")
xlim([0 160]);
ylabel("V_t(V)")

% MOL
nexttile
cycle_number_toplot=200;
Cycle_length=A19.cycle_time(cycle_number_toplot+1)-A19.cycle_time(cycle_number_toplot);
stp=A19.cycle_time(cycle_number_toplot)-Cycle_length/2+2550; etp=stp+Cycle_length+150;
plot((A19.t(A19.t>stp & A19.t<etp)-stp)/60, A19.Vt_t(A19.t>stp & A19.t<etp), linewidth=2);
time_plot=D19_t(D19_cyc==200);
hold on; plot((time_plot-time_plot(1)+60)/60,D19_V(D19_cyc==200), linewidth=2)
title ("MOL")
xlim([0 160])

% EOL
nexttile
cycle_number_toplot=400;
Cycle_length=A19.cycle_time(cycle_number_toplot+1)-A19.cycle_time(cycle_number_toplot);
stp=A19.cycle_time(cycle_number_toplot)-Cycle_length/2+2550; etp=stp+Cycle_length+200;
plot((A19.t(A19.t>stp & A19.t<etp)-stp)/60, A19.Vt_t(A19.t>stp & A19.t<etp), linewidth=2);
time_plot=D19_t(D19_cyc==400);
hold on; plot((time_plot-time_plot(1)+60)/60,D19_V(D19_cyc==400), linewidth=2)
title ("EOL")
xlim([0 160])

%BOL
nexttile
cycle_number_toplot=1;
Cycle_length=A19.cycle_time(cycle_number_toplot+1)-A19.cycle_time(cycle_number_toplot);
stp=A19.cycle_time(cycle_number_toplot)-Cycle_length/2+2550; etp=stp+Cycle_length+200;
plot((A19.t(A19.t>stp & A19.t<etp)-stp)/60, A19.I(A19.t>stp & A19.t<etp)/5, linewidth=2);
time_plot=D19_t(D19_cyc==2);
hold on; plot((time_plot-time_plot(1)+100)/60,D19_I(D19_cyc==2)/5, linewidth=2)
xlim([0 160])
ylabel("Current (A)"); xlabel("time(min)")
%MOL
nexttile
cycle_number_toplot=200;
Cycle_length=A19.cycle_time(cycle_number_toplot+1)-A19.cycle_time(cycle_number_toplot);
stp=A19.cycle_time(cycle_number_toplot)-Cycle_length/2+2550; etp=stp+Cycle_length+75;
plot((A19.t(A19.t>stp & A19.t<etp)-stp)/60, A19.I(A19.t>stp & A19.t<etp)/5, linewidth=2);
time_plot=D19_t(D19_cyc==200);
hold on; plot((time_plot-time_plot(1)+60)/60,D19_I(D19_cyc==200)/5, linewidth=2)
xlim([0 160])

%EOL
nexttile
cycle_number_toplot=400;
Cycle_length=A19.cycle_time(cycle_number_toplot+1)-A19.cycle_time(cycle_number_toplot);
stp=A19.cycle_time(cycle_number_toplot)-Cycle_length/2+2550; etp=stp+Cycle_length+75;
plot((A19.t(A19.t>stp & A19.t<etp)-stp)/60, A19.I(A19.t>stp & A19.t<etp)/5, linewidth=2);
time_plot=D19_t(D19_cyc==400);
hold on; plot((time_plot-time_plot(1)+60)/60,D19_I(D19_cyc==400)/5, linewidth=2)
xlim([0 160])

%%
figure(3192);
tiledlayout(2,3)
nexttile
cycle_number_toplot=2;
Cycle_length=A190.cycle_time(cycle_number_toplot+1)-A190.cycle_time(cycle_number_toplot); %sim
stp=A190.cycle_time(cycle_number_toplot)-Cycle_length/2+2550; etp=stp+Cycle_length+250;
plot((A190.t(A190.t>stp & A190.t<etp)-stp)/60, A190.Vt_t(A190.t>stp & A190.t<etp), linewidth=2);
time_plot=D19_t(D19_cyc==2);
hold on; plot((time_plot-time_plot(1)+100)/60,D19_V(D19_cyc==2), linewidth=2)
title ("BOL")
legend("Sim based on C/5 & 1.5C & mixed rate fit","Experiment")
xlim([0 160]);
ylabel("V_t(V)")
% MOL
nexttile
cycle_number_toplot=200;
Cycle_length=A190.cycle_time(cycle_number_toplot+1)-A190.cycle_time(cycle_number_toplot);
stp=A190.cycle_time(cycle_number_toplot)-Cycle_length/2+2550; etp=stp+Cycle_length+150;
plot((A190.t(A190.t>stp & A190.t<etp)-stp)/60, A190.Vt_t(A190.t>stp & A190.t<etp), linewidth=2);
time_plot=D19_t(D19_cyc==200);
hold on; plot((time_plot-time_plot(1)+60)/60,D19_V(D19_cyc==200), linewidth=2)
xlim([0 160]);

title ("MOL")
% EOL
nexttile
cycle_number_toplot=400;
Cycle_length=A190.cycle_time(cycle_number_toplot+1)-A190.cycle_time(cycle_number_toplot);
stp=A190.cycle_time(cycle_number_toplot)-Cycle_length/2+2550; etp=stp+Cycle_length+200;
plot((A190.t(A190.t>stp & A190.t<etp)-stp)/60, A190.Vt_t(A190.t>stp & A190.t<etp), linewidth=2);
time_plot=D19_t(D19_cyc==400);
hold on; plot((time_plot-time_plot(1)+60)/60,D19_V(D19_cyc==400), linewidth=2)
title ("EOL")
xlim([0 160]);


nexttile
cycle_number_toplot=1;
Cycle_length=A190.cycle_time(cycle_number_toplot+1)-A190.cycle_time(cycle_number_toplot);
stp=A190.cycle_time(cycle_number_toplot)-Cycle_length/2+2550; etp=stp+Cycle_length+200;
plot((A190.t(A190.t>stp & A190.t<etp)-stp)/60, A190.I(A190.t>stp & A190.t<etp)/5, linewidth=2);
time_plot=D19_t(D19_cyc==2);
hold on; plot((time_plot-time_plot(1)+100)/60,D19_I(D19_cyc==2)/5, linewidth=2)
ylabel("Current (A)"); xlabel("time(min)")
xlim([0 160]);

nexttile
cycle_number_toplot=200;
Cycle_length=A190.cycle_time(cycle_number_toplot+1)-A190.cycle_time(cycle_number_toplot);
stp=A190.cycle_time(cycle_number_toplot)-Cycle_length/2+2550; etp=stp+Cycle_length+75;
plot((A190.t(A190.t>stp & A190.t<etp)-stp)/60, A190.I(A190.t>stp & A190.t<etp)/5, linewidth=2);
time_plot=D19_t(D19_cyc==200);
hold on; plot((time_plot-time_plot(1)+60)/60,D19_I(D19_cyc==200)/5, linewidth=2)
xlim([0 160]);


nexttile
cycle_number_toplot=400;
Cycle_length=A190.cycle_time(cycle_number_toplot+1)-A190.cycle_time(cycle_number_toplot);
stp=A190.cycle_time(cycle_number_toplot)-Cycle_length/2+2550; etp=stp+Cycle_length+75;
plot((A190.t(A190.t>stp & A190.t<etp)-stp)/60, A190.I(A190.t>stp & A190.t<etp)/5, linewidth=2);
time_plot=D19_t(D19_cyc==400);
hold on; plot((time_plot-time_plot(1)+60)/60,D19_I(D19_cyc==400)/5, linewidth=2)
xlim([0 160]);






%% Create cell19 csv drive cycle
%
clear Drive_peyman time_Pey Drive_peyman2
time_Pey=D19_t(D19_cyc==2);
I_Pey=D19_I(D19_cyc==2);
Drive_peyman(:,1)=time_Pey(230:935)-time_Pey(230);
Drive_peyman(:,2)=I_Pey(230:935);
figure; hold on;
plot(Drive_peyman(:,1),Drive_peyman(:,2))
% writematrix(Drive_peyman,"Peyman_cycling_DriveCycle.csv")
TTime=1:1:max(Drive_peyman(:,1));
Icurr=interp1(Drive_peyman(:,1),Drive_peyman(:,2),TTime,"spline");

Drive_peyman2(:,1)=TTime;
Drive_peyman2(:,2)=Icurr;
plot(TTime,Icurr)

% writematrix(Drive_peyman2,"Peyman_cycling_DriveCycle.csv")
%}