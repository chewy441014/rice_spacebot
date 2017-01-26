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
for i = linspace(k_s_min,k_s_max,10)
    for j = 1:4
        controller = j;
        k_s = i;
        load_system('gui1');
        set_param('gui1','SimulationCommand','start')
        Simulink.sdi.view
    end
end