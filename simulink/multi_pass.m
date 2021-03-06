%%%
%%% General Instructions
%%% Load the parameters
%%% Select your plant and controller
%%% Load the simulink model
%%% Run the simulink model

run('parameters.m')
controller = 1;
plant = 1;
k_s_max = 124;
k_s_min = k_s_max/3;
test = 0;
for i = linspace(k_s_min,k_s_max,2)
    for j = 1:4
        controller = j;
        k_s = i;
        load_system('gui1');
        set_param('gui1','SimulationCommand','start')
        pause(10);
        test = test + 1;
        TestData.theta_m{test} = theta_m.signals.values;
        TestData.theta_L{test} = theta_L.signals.values;
        TestData.commanded_torque{test} = commanded_torque.signals.values;
        TestData.torque_RMS{test} = torque_RMS.signals.values;
    end
end

%%
hold on
