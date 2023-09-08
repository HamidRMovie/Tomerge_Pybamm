clear all
close all
%%
R=8.3144598;
F=96485.33;
T=273.15+25;

epsilon_n=0.76; %epsilon_p=0.45;
R_n=1.35e-5; %R_p=3.5e-6;
l_n=5.5605e-5; %l_p=6.7e-5;
% k0_n=4.2e-6; k0_p=4.8e-6;
delta0=5e-9;p=delta0;
as_n=3*epsilon_n/R_n; %as_p=3*epsilon_p/R_p;
c0_EC=4541.0; %EC initial concentration in electrolyte [mol.m-3]
sigma=9.59e-5; 


A_n=1.35e-1;
% A_n=2.05e-1;
xx=[0.85/2, 0.85];

for i=1:2
x=xx(i);
USEI=0.4;
Un=Un_Graphite(x);
eta_sei=Un-USEI;

fz=exp(-0.5*F/R/T*eta_sei);
fzz(i)=fz;
end




%% load data

data56.Time=[0, 49.0046,105.36645,146.14284];
data56.LLI=[8.40E-09,0.001079545,0.000704158,0.002417352];

data93.Time=[0,49.00463,78.16399,111.8813,151.9513];
data93.LLI=[9.94E-08,3.68E-03,4.81E-03,5.74E-03,7.43E-03];

Time=[data56.Time,data93.Time]*3600*24;
fzz2=[fzz(1)*ones(1,4),fzz(2)*ones(1,5)];
LLI=[data56.LLI, data93.LLI];




