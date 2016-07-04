
%% 6DoF Simulation
    % Authors: Gabriel Bitencourt de A. Moura, Gustavo Iha R. Moraes
    % Version 1.0.0

%% Initially, this class has all the main constants used in the simulator.
classdef SimulatorConstants
    properties (Constant)

        %% Propelent data
        PROPELENT_INICIAL_MASS = 3000;                          %**** kg
        PROPELENT_BURN_DURATION = 30000;                        %**** s

        %% Rocket data
        ROCKET_DRY_MASS = 2000;                                 %**** kg
        ROCKET_THRUST = 3000;                                   %**** kg*m/s^2
        ROCKET_LATERAL_AREA = 200;                              %**** m^2
        ROCKET_FRONTAL_AREA = 100;                              %**** m^2
        ROCKET_CG_DISTANCE = 1000*10^(-3);                      % Distance from tip of nose to CG

        %% Rocket's Moment of Inercia around the three axes
        ROCKET_INERCIA_MOMENT_Z = 33730861.08    * 1000;        %**** kg * m^2
        ROCKET_INERCIA_MOMENT_X = 13826446202.68 * 1000;        %**** kg * m^2
        ROCKET_INERCIA_MOMENT_Y = 13826555274.94 * 1000;        %**** kg * m^2

        %% Rocket's drag coefficients
        ROCKET_DRAG_COEFFICIENT_FRONTAL = 0.45;
        ROCKET_DRAG_COEFFICIENT_LATERAL = 0.45;
        
        %% Atmosphere
        AIR_DENSITY = 1.2922                                    %**** kg/m^3
        AIR_SPEED = 300;                                        %**** m/s
        WIND_SPEED_X = 0;                                       %**** m/s
        WIND_SPEED_Y = 0;                                       %**** m/s
        WIND_SPEED_Z = 0;                                       %**** m/s

        %% Earth
        EARTH_RATIO = 6371000;                                  % m
        EARTH_MASS = 5.972e24;                                  % kg
        GRAVITATIONAL_CONSTANT = 6.67384e-11;                   % m^3/kg/s^2
        PAYLOAD_MASS = 300;                                     % kg
        
    end
    
    %% Class Methods
    
    methods (Static)
        
        function mass = Mass
            %mass = ROCKET_DRY_MASS + ROCKET_FUEL_MASS;
            mass = SimulatorConstants.PROPELENT_INICIAL_MASS;
        end
    end
end

        % Caption: ****the values above aren't defined yet. For now, we are
        % using UFABCRocket's values.
