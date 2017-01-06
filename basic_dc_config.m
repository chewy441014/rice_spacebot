% Robert Baines
% Nathan Bucki
% Colin Feng
% Preston Hill
% Claudia Kann
% Ian Tomkinson
% SPACEBOT
%
%
% DC Motor Configuration
%
% T_m(t) = motor torque 
% b_m = motor viscuous friction coefficient
% k = spring constant
% theta_m = motor displacement
% omega_m = motor velocity
% J_m = motor inertia
% theta_L = load displacement
% omega_L = load velocity
% J_L = load inertia
% b_L = load viscuous friction coefficient
% N = gear ratio
% k_t = motor torque constant

clear;

%% Controller Gains
K_p = 100;    % Proportional Gain
K_d = 10;    % Derivative Gain
K_i = 100;    % Integral Gain

T_sample_control = 1e-3;    % Sample period, s

%% System Parameters
m = 0.25;      % Mass of arm, kg
g = 9.8;    % Gravity, m/s^2
l = 0.25;   % Distance to center of mass of arm, m
theta_c = 0; % Parallel spring equilibrium point, radians

J_m = m*l^2;    % Motor inertia, kg*m^2
J_L = 4.17e-6;    % Load inertia, kg*m^2
b_m = 4.5e-4;    % Motor viscous friction coefficient, N*m*s
b_L = 1e-2;    % Load viscous friction coefficient, N*m*s
N = 1;      % Gear ratio
k_1 = 10;    % Series spring coefficient, N*m
k_2 = 0;    % Parallel spring coefficient, N*m

K_t = 0.022879; % Torque constant, N*m/A
K_a = 1.4;      % Amp constant, A/V

% DC Armature Constants from 343 Textbook example
% k_b = K_t;
% L_a = 2E-03; %H
% c = 1E-04; %Nms/rad
% R_a = 0.5; %Ohms
% I = 9E-05; %kgm^2

%% Initial Conditions


%% Save Variables
save('dc_config')