%  Resistabnce 
clear all
close all

% A=load("F:\Git Hub rep\PyBaMM\UMBLFeb2022\Andrew_100DOD_experiment_feb142.mat");
% A=load("F:\Git Hub rep\PyBaMM\UMBLFeb2022\Andrew_100DOD_experiment_C50CV_Mar2_3.mat");
% A=load("F:\Git Hub rep\PyBaMM\UMBLFeb2022\Andrew_100DOD_experiment_C50CV_Mar6_1.mat");


% A=load("F:\Git Hub rep\PyBaMM\UMBLFeb2022\Andrew_100DOD_experiment_epe_03_Mar9_3.mat"); % resis 1.5e6
A=load("F:\Git Hub rep\PyBaMM\UMBLFeb2022\Andrew_100DOD_experiment_refit_resis13e5_Mar18.mat"); % resis 1.3e6


B=readmatrix("F:\Git Hub rep\PyBaMM\UMBLFeb2022\data\UMBL2022FEB_CELL152002_cycling_data.csv");

t2=B(:,1); I2=-B(:,2)/1000; V2=B(:,3); cyc2=B(:,8);

%%
A.diffI=diff(A.I);
% plot(A.diffI);
% hold on;
% plot((A.Vt_t))
indices=find(A.diffI>2);
A.Rs=-(A.Vt_t(indices+1)-A.Vt_t(indices-1))./2.5;
figure(8);plot((1:1:length(A.Rs))*20, A.Rs)
%%
I2_2=I2((t2>3.45e5 & t2<7.8e5)|(t2>=1.075e6 & t2<=1.5e6)|(t2>=1.78e6 & t2<=2.67e6)...
    |(t2>=2.95e6 & t2<=3.8e6)|(t2>=4.1e6 & t2<=4.95e6)|(t2>=5.2e6 & t2<=6.08e6)...
    |(t2>=6.35e6 & t2<=7.19e6)|(t2>=7.45e6 & t2<=8.32e6)|(t2>=8.55e6 & t2<=9.42e6)...
    |(t2>=9.66e6 & t2<=10.5e6)|(t2>=10.7e6 & t2<=11.46e6));
V2_2=V2((t2>3.45e5 & t2<7.8e5)|(t2>=1.075e6 & t2<=1.5e6)|(t2>=1.78e6 & t2<=2.67e6)...
    |(t2>=2.95e6 & t2<=3.8e6)|(t2>=4.1e6 & t2<=4.95e6)|(t2>=5.2e6 & t2<=6.08e6)...
    |(t2>=6.35e6 & t2<=7.19e6)|(t2>=7.45e6 & t2<=8.32e6)|(t2>=8.55e6 & t2<=9.42e6)...
    |(t2>=9.66e6 & t2<=10.5e6)|(t2>=10.7e6 & t2<=11.46e6));

t2_2=t2((t2>3.45e5 & t2<7.8e5)|(t2>=1.075e6 & t2<=1.5e6)|(t2>=1.78e6 & t2<=2.67e6)...
    |(t2>=2.95e6 & t2<=3.8e6)|(t2>=4.1e6 & t2<=4.95e6)|(t2>=5.2e6 & t2<=6.08e6)...
    |(t2>=6.35e6 & t2<=7.19e6)|(t2>=7.45e6 & t2<=8.32e6)|(t2>=8.55e6 & t2<=9.42e6)...
    |(t2>=9.66e6 & t2<=10.5e6)|(t2>=10.7e6 & t2<=11.46e6));
%%
diffI2=diff(I2);
diffI2_2=diff(I2_2);

indices2_2=find(diffI2_2>2.2 & diffI2_2<2.6 );
indices2=find(diffI2>2.2 & diffI2<2.6 );

Rs2_2=-(V2_2(indices2_2+1)-V2_2(indices2_2-1))./2.5;
Rs2=-(V2(indices2+1)-V2(indices2-1))./2.5;

figure;plot(diffI2_2);
hold on;
plot((V2_2))

% figure;plot(diffI2)
Rs2_3=Rs2_2(Rs2_2>0);
figure(8); hold on; plot(Rs2_3)