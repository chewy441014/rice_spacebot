% Preston Hill
% SPACEBOT
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

A = [0, 1, -1;
    -K/J_m, -Bm/J_m, 0;
    K/J_L, 0, 0];
B = [0;
    1/J_m;
    0];
C = [1, 0, 0];
D = 0;

% Transfer function from motor torque to spring deflection
[n,d] = ss2tf(A,B,C,D);