% Robert Baines
% Nathan Bucki
% Colin Feng
% Preston Hill
% Claudia Kann
% Ian Tomkinson
% SPACEBOT
%
%
% Josh Mehling's
% SEA Model
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

% Loads motor configuration
load('sea_config');

% Denominator for all other transfer functions
D_s = [N^2 * J_m * J_L, ... %s^4
    N^2 * J_m * B_L + N^2 *B_m * J_L, ... %s^3
    K * J_L + N^2 *B_m * B_L + N^2 * J_m * K, ... %s^2
    K * B_L + N^2 * B_m * K, ... %s^1
    0]; %s^0

% TF Current to Velocity
num1 = [N^2 * k_t * J_L, N^2 * k_t * B_L, N^2 * k_t * K, 0];
curr2vel = tf(num1,D_s);

% TF External Torque to Velocity
num2 = [N * K, 0];
text2vel = tf(num2,D_s);

% TF Current to Load Displacement
num3 = N * k_t * K;
curr2ldisp = tf(num3,D_s);

% TF External Torque to Load Displacement
num4 = [N^2 * J_m, N^2 * B_m, K];
text2ldisp = tf(num4,D_s);

% TF Current to Spring Torque
num5 = [N * J_L * k_t * K, N * B_L * k_t * K, 0];
curr2tk = tf(num5,D_s);

% TF External Torque to Spring Torque
num6 = [-N^2 * J_m * K, -N^2 * B_m * K, 0];
text2tk = tf(num6,D_s);