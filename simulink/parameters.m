% Robert Baines
% Nathan Bucki
% Colin Feng
% Preston Hill
% Claudia Kann
% Ian Tomkinson
% SPACEBOT

clear;

%% Controller Gains
K_p = 0.025;    % Proportional Gain
K_d = 0.005;    % Derivative Gain
K_i = 0.1;    % Integral Gain

T_sample_control = 500e-6;    % Sample period, s

%% System Parameters
m = 0.0907;      % Mass of arm, kg
g = 9.81;    % Gravity, m/s^2
l = 0.16;   % Distance to center of mass of arm, m
theta_c = 0; % Parallel spring equilibrium point, radians

J_motor = 4.17e-6; % Motor inertia, kg*m^2
J_sgear = 2e-8; % Small gear inertia, kg*m^2
J_bgear = 2e-6; % Big gear inertia, kg*m^2
J_m = J_motor + J_sgear + J_bgear;    % Drive inertia, kg*m^2

J_ts = 9.09e-6; % Torsional spring inertia, kg*m^2
J_hubf = 4.66e-5; % Hub flange inertia, kg*m^2
J_hub = 1.94e-5; % Hub inertia, kg*m^2
J_shaft = 3.1e-4; % Shaft inertia, kg*m^2
J_arm = 2.37e-3; % Arm inertia, kg*m^2
J_L = J_ts + J_hubf + J_hub + J_shaft + J_arm;    % Load inertia, kg*m^2

b_m = 4.5e-3;    % Motor viscous friction coefficient, N*m*s
b_L = 1e-2;    % Load viscous friction coefficient, N*m*s
N = 6;      % Gear ratio

k_s = 8.594;    % Series spring coefficient, N*m/rad
k_p = 1;    % Parallel spring coefficient, N*m/rad

K_t = 0.0226; % Torque constant, N*m/A
K_a = 4.8788;      % Amp constant, A/V

%% Initial Conditions
deg2rad = @(x) x*pi/180;
theta_L0 = deg2rad(0);
theta_m0 = deg2rad(0);

%% Controller parameters
controller = 1;
plant = 1;
control_value = 0;

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
assignin('base','N',N);
assignin('base','k_s',k_s);
assignin('base','k_p',k_p);
assignin('base','K_t',K_t);
assignin('base','K_a',K_a);
assignin('base','controller',controller);
assignin('base','plant',plant);
assignin('base','control_value',control_value)
assignin('base','theta_L0',theta_L0);
assignin('base','theta_m0',theta_m0);

% %PID Position Desired Position
% assignin('base','pid_pos_desired',0);
% 
% %PID Torque Desired Torque
% assignin('base','pid_tor_desired',0);
% 
% %Basic Impedance Control
% %Desired Virtual Damping
% assignin('base','pid_imp_vdam_con',0);
% %Desired Vitual Spring Constant
% assignin('base','pid_imp_vk_con',0);
% %Desired Virtual Spring Zero Position
% assignin('base','pid_imp_vk_pos',0);
% %Desired Virtual Damper Zero Velocity
% assigin('base','pid_imp_vdam_vel',0);