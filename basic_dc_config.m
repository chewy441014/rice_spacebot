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
% B_m = motor viscuous friction coefficient
% K = spring constant
% theta_m = motor displacement
% omega_m = motor velocity
% J_m = motor inertia
% theta_L = load displacement
% omega_L = load velocity
% J_L = load inertia
% B_L = load viscuous friction coefficient
% N = gear ratio
% k_t = motor torque constant

J_m = 1;
J_L = 1;
B_m = 1;
B_L = 1;
N = 1;
K = 1;

% DC Armature Constants from 343 Textbook example
k_t = 0.05; %Nm/A
k_b = k_t;
L_a = 2E-03; %H
c = 1E-04; %Nms/rad
R_a = 0.5; %Ohms
I = 9E-05; %kgm^2

ki = 0; kp = 1; kd = 0;
amp_gain = 1;

save('dc_config')