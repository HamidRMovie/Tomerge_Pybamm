clear
close all


HPPC_list=["",...
    "GMJuly2022_CELL093_RPT_1_P25C_5P0PSI_20220914_R0_CH019_20220914104106_36_3_3_2818579441_HPPC.csv",...
    % "GMJuly2022_CELL093_RPT_1_P25C_5P0PSI_20221102_R0_CH019_20221102154009_36_3_3_2818579463_HPPC.csv",...
    % "GMJuly2022_CELL093_RPT_3_P25C_5P0PSI_20221201_R0_CH019_20221201180951_36_3_3_2818579472_HPPC.csv",...
    % "GMJuly2022_CELL093_RPT_3_P25C_5P0PSI_20230104_R0_CH019_20230104113113_36_3_3_2818579476_HPPC.csv",...
    % "GMJuly2022_CELL093_RPT_3_P25C_5P0PSI_20230213_R0_CH019_20230213134103_36_3_3_2818579480_HPPC.csv",...
    ];

Cell14Hamid=readmatrix(HPPC_list{2});
Cell_table=readtable(HPPC_list{2});
Date=Cell_table(:,2);
aa=Date{:,1};
t=datetime(aa,'InputFormat','yyyy-MM-dd HH:mm:ssXXXX','TimeZone','America/New_York');
t=t-t(1);
Time=seconds(t);


I=Cell14Hamid(2:end,3); Vt=Cell14Hamid(2:end,4);

%% Unique for Pybammm input
[Tuniq,ia,ic]=unique(Time);
Vtuniq=Vt(ia);
Iuniq=I(ia);
plot(Tuniq,Vtuniq,LineWidth=2);
HHH=load ("/Users/hamid/piibamm/PyBaMM/GM2022/cycling_aging/HPPC_July7.mat");
hold on;
plot(HHH.t,HHH.Vt_t,LineWidth=2)

legend("Data","model")
%%
Vout_uniq=Vtuniq(1:6e4);
writematrix(Vout_uniq,"/Users/hamid/piibamm/PyBaMM/GM2022/cycling_aging/HPPC_voltage_cell093.csv")


