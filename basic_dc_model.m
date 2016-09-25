% Robert Baines
% Nathan Bucki
% Colin Feng
% Preston Hill
% Claudia Kann
% Ian Tomkinson
% SPACEBOT
%
%
% Preston's 
% SEA Model (Based on 343 and 420 Textbooks)
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
load('dc_config');

% State Space representation of SEA with armature controlled DC motor
A = [0, 1, -1; 
    -K/J_m, -B_m/J_m, 0;
    K/J_L, 0, -B_L/J_L];
B = [0; 
    1/J_m; 
    0];
C = [1, 0, 0;
    0, 0, 1];
D = 0;

% Transfer Function Motor Torque to Spring Displacement
[num1,den1] = ss2tf(A,B,C(1,:),D);
tm2kdisp = tf(num1,den1);

% Transfer Function Motor Torque to Load Position
[num2,den2] = ss2tf(A,B,C(2,:),D);
tm2lthet = tf(num2,den2);
integral = tf(1,[1,0]);
tm2lthet = tm2lthet*integral;

% Transfer Function Voltage to Motor Torque
num2 = [I * k_t, c * k_t];
den2 = [L_a * I, R_a * I + c * L_a, c * R_a + k_b * k_t];
vol2tm = tf(num2,den2);

% Compare step input to example in 343 textbook, page 306
%opt = stepDataOptions('StepAmplitude',10);
%step(vol2tm,opt)

% Transfer Function Voltage to Load Velocity and Spring Displacement
vol2kdisp = vol2tm * tm2kdisp;
vol2lthet = vol2tm * tm2lthet;

% Position Control on Basic DC SEA Model
desired_theta = pi/4;
controller1 = pid(kp, ki, kd);

% Unit Feedback
T = feedback(controller1*amp_gain*vol2lthet,1);

% Step Response
opt2 = stepDataOptions('StepAmplitude',desired_theta);
step(T,opt2);

% Impulse Response
figure;
impulse(T)