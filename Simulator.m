%% 6DoF Simulation 
% Authors: Gabriel Bitencourt de A. Moura, Gustavo Iha R. Moraes
% Version 1.0.0

classdef Simulator < handle
    % Use this class to setup and run the simulation
    % Obs: extends handle so it's possible to alter properties with a
    % function inside this class
    
    %% Simulation properties
    properties
        
        % User messages
        StartupMessage = 'Hello';
        InputErrorMessage = 'Invalid input. Please try again';
        
        % Variables to initialize
        initialConditions = {'Position';'LinearVelocity';'AngularVelocity';'LinearAcceleration';'AngularAcceleration';'Phi';'Psi';'Theta'}
        
        % Rocket object
        Rocket = RocketProperties;
    end
    
    %% Class Methods
    
    methods
        
        %% Sets up the simulation.
        
        function Setup(obj)
            
            % Display startup message
            disp(obj.StartupMessage);
            % Ask user if changing initial conditions is desired. Numeric
            % values will automaticaly be accepted, and the letter 'N' will
            % mean the default value
            a = 1;
            while a <= size(obj.initialConditions, 1)
                
                % Get default value of property
                oldValue = obj.Rocket.(char(obj.initialConditions(a)));
                prompt = ['Type new value of initial ' char(obj.initialConditions(a)) ' or type N to skip this step and use default value: ' oldValue];
                newValue = input(prompt);
                
                % To Do: implement proper validation
                %if (validation_ok || isempty(newValue))

                    a = a + 1;
                
                    if ~isempty(newValue)
                        obj.Rocket.(char(obj.initialConditions(a - 1))) = newValue;
                    else
                        continue;
                    end
                    
                %else
                    %disp(obj.InputErrorMessage);
                %end
                
                % Check if input is empty. If so, skip to next step.
                
            end
        end
        
        %% Executes the simulation
        
        function Run(~)
            
            Initial = [0;0;0;0;0;0;0;0;0];
            
            [t,X] = ode45(@Dynamics, [0 20], Initial);
        end
        
        %% Dynamics equations
        
        %function eq = Dynamics(t,X)
        %    eq = obj.Rocket.Dynamics(t,X);
        %end
        
    end
    
end

