%% 6DoF Simulation 
% Authors: Gabriel Bitencourt de A. Moura, Gustavo Iha R. Moraes
% Version 1.0.0

%% Rocket Initial Conditions
classdef RocketInitialConditions
    properties
        Rocket_Position = [0,0,0];
        Rocket_LinearVelocity = [0,0,0];
        Rocket_AngularVelocity = [0,0,0];
        Rocket_LinearAcceleration = [0,0,0];
        Rocket_AngularAcceleration = [0,0,0];
    end   
    methods (Static)
        function InitialConditions = RocketInitialConditions()
            InitialConditions = {Rocket_LinearVelocity; Rocket_AngularVelocity; Rocket_LinearAcceleration; Rocket_AngularAcceleration};
        end
    end
    
end

