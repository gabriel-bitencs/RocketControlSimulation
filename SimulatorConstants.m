
%% 6DoF Simulation 
    %Authors: Gabriel Bitencourt de A. Moura, Gustavo Iha R. Moraes
    %Version 1.0.0
    %Atualizations: 1.Building a class of constants
    
%% Initially, this class has all the main constants used in the simulator.
classdef SimulatorConstants
    properties (Constant)      
        %% Propelent data
        PROPELENT_INICIAL_MASS = 3000;                         %**** kg
        PROPELENT_BURN = 30000;                               %**** s
        
        %% Rocket data
        ROCKET_MASS = 2000;                                    %**** kg
        ROCKET_THRUST = 3000;                                  %**** kg*m/s^2
        ROCKET_LATERAL_AREA = 200;                             %**** m?
        ROCKET_FRONTAL_AREA = 100;                             %**** m?
        
        %% Rocket Moment of Inercia around the three axes
        ROCKET_INERCIA_MOMENTz = 33730861.08    * 1000;        %**** kg * m^2
        ROCKET_INERCIA_MOMENTx = 13826446202.68 * 1000;        %**** kg * m^2
        ROCKET_INERCIA_MOMENTy = 13826555274.94 * 1000;        %**** kg * m^2
        
        %% Others
        EARTH_RATIO = 6371000;                                 % m
        EARTH_MASS = 5.972e24;                                 % kg
        GM = 6.67384e-11;                                      % m^3/kg/s^2
        AIR_SPEED = 300;                                       %**** m/s
        DISTANCE_CP_CG = 463782                                %**** m
        
    end
end

        %Caption: ****the values above aren't define yet. For now, we are
        %using UFABCRocket's values.
