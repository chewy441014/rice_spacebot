% Robert Baines
% Nathan Bucki
% Colin Feng
% Preston Hill
% Claudia Kann
% Ian Tomkinson
% SPACEBOT

clear;
Val_Torque = load('Val_Torque_Time_Traj.mat');
Val_Torque = Val_Torque.Val_Torque;

%% Controller Gains
K_p = 40;    % Proportional Gain
K_d = 2;    % Derivative Gain
K_i = 0;    % Integral Gain

pid_torque_Kp = 0;
pid_torque_Kd = 0;
pid_torque_Ki = 5;

pid_imp_Kp = 40; % Simple impedance spring constant
pid_imp_Kd = 2; % Simple impedance damping constant

T_sample_control = 500e-6;    % Sample period, s

%% System Parameters
m = 1.9113;      % Mass of arm, kg
g = 9.81;      % Gravity, m/s^2
l = 0.16;   % Distance to center of mass of arm, m
theta_c = -1; % Parallel spring equilibrium point, radians

J_motor = 2.832e-4; % Motor inertia, kg*m^2
J_m = J_motor; %Drive inertia, kg*m^2

J_ts = 9.09e-6; % Torsional spring inertia, kg*m^2
J_hubf = 4.66e-5; % Hub flange inertia, kg*m^2
J_hub = 1.94e-5; % Hub inertia, kg*m^2
J_shaft = 3.1e-4; % Shaft inertia, kg*m^2
J_arm = m*l^2; % Arm inertia, kg*m^2
J_L = J_ts + J_hubf + J_hub + J_shaft + J_arm;    % Load inertia, kg*m^2

b_m = 1e-2;    % Motor viscous friction coefficient, N*m*s
b_L = 1e-2;    % Load viscous friction coefficient, N*m*s

k_s = 300;    % Series spring coefficient, N*m/rad
k_p = 1;    % Parallel spring coefficient, N*m/rad

%%% Duty Cycle 
tau_continuous = 3.38; %Nm
tau_max = 5; %Nm

%% Initial Conditions
deg2rad = @(x) x*pi/180;
theta_L0 = deg2rad(0);
theta_m0 = deg2rad(0);

%% Controller parameters
% controller = 1;
% plant = 1;
control_value = 0.5;

%% Gui setup
assignin('base','K_p',K_p);
assignin('base','K_d',K_d);
assignin('base','K_i',K_i);
assignin('base','T_sample_control',T_sample_control);
assignin('base','m',m);
assignin('base','g',g);
assignin('base','l',l);
assignin('base','theta_c',theta_c);
assignin('base','J_m',J_m);
assignin('base','J_L',J_L);
assignin('base','b_m',b_m);
assignin('base','b_L',b_L);
assignin('base','k_s',k_s);
assignin('base','k_p',k_p);
% assignin('base','controller',controller);
% assignin('base','plant',plant);
assignin('base','control_value',control_value)
assignin('base','theta_L0',theta_L0);
assignin('base','theta_m0',theta_m0);
assignin('base','pid_imp_Kp',pid_imp_Kp);
assignin('base','pid_imp_Kd',pid_imp_Kd);
assignin('base','pid_torque_Kp',pid_torque_Kp);
assignin('base','pid_torque_Kd',pid_torque_Kd);
assignin('base','pid_torque_Ki',pid_torque_Ki);
assignin('base','tau_continuous',tau_continuous);
assignin('base','tau_max',tau_max);
assignin('base','Val_Torque',Val_Torque);