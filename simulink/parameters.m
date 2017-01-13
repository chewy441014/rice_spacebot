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
k_s = 10;    % Series spring coefficient, N*m
k_p = 0;    % Parallel spring coefficient, N*m

K_t = 0.022879; % Torque constant, N*m/A
K_a = 1.4;      % Amp constant, A/V

controller = 1;
plant = 1;
control_value = 0;

assignin('base','K_p',K_p);
assignin('base','K_d',K_d);
assignin('base','K_i',K_i);
assignin('base','T_sample_control',T_sample_control);
assignin('base','m',m);
assignin('base','g',9.8);
assignin('base','l',0.25);
assignin('base','theta_c',theta_c);
assignin('base','J_m',J_m);
assignin('base','J_L',J_L);
assignin('base','b_m',b_m);
assignin('base','b_L',b_L);
assignin('base','N',N);
assignin('base','k_s',k_s);
assignin('base','k_p',k_p);
assignin('base','K_t',K_t);
assignin('base','K_a',K_a);
assignin('base','controller',controller);
assignin('base','plant',plant);
assignin('base','control_value',control_value)