% Colin Feng
% Preston Hill
% Claudia Kann
% Ian Tomkinson
% SPACEBOT
%
%
% SEA Motor Configuration
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
k_t = 1; 

save('sea_config')