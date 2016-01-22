%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hybrid and Embedded control systems
% Homework 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear  
init_tanks;
g = 9.82;
Tau = 1/alpha1*sqrt(2*tank_h10/g);
K = 60*beta*Tau;
Gamma = alpha1^2/alpha2^2;
%TOOOYOOTOTOTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Continuous Control design
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s = tf('s');

upperNUM = {[K]};
upperDEN = {[Tau 1]};
lowerNUM = {[Gamma]};
lowerDEN = {[Gamma*Tau 1]};
uppertank=tf([upperNUM],[upperDEN]); % Transfer function for upper tank
lowertank=tf([lowerNUM],[lowerDEN]); % Transfer function for upper tank

uppertank=tf(upperNUM,upperDEN); % Transfer function for upper tank
lowertank=tf(lowerNUM,lowerDEN); % Transfer function for upper tank
G=uppertank*lowertank; % Transfer function from input to lower tank level
G = lowertank; % for task 2

% CalculatePID paramaeters
chi = 0.5;
zeta = 0.7;
omega0 = 0.1;
[K, Ti, Td, N] = polePlacePID(chi, omega0, zeta,Tau,Gamma,K);
C = K + K/(Ti*s) + (K*Td*N*s)/(s+N);
F = C; % Transfer function for the controller

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Digital Control design
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ts = 1; % Sampling time

% Discretize the continous controller, save it in state space form
% [Aa,Ba,Ca,Da] = ; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Discrete Control design
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Gd = 1; % Sampled system model
Fd = 1; % Transfer function for discrete designed controller