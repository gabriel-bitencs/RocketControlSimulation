
%6DoF Simulation
%Authors: Gabriel Bitencourt de A. Moura, Gustavo Iha R. Moraes
%Version 1.0.1
%Atualizations: 1.Building a class of constants

classdef Constants
    properties (Constant)
        AIR_SPEED       = 300               %**** m/s
        ROCKET_MASS     = 2000              %**** kg
        EARTH_RATIO     = 6371000;          % m
        GRAVITATIONAL   = 6.67384e-11;      % m^2/s^2
        
    %Distance from the CG and CP to the rocket's nose.
        CG_DISTANCE     = 0.5               %**** m
        CP_DISTANCE     = 0.7               %**** m 
    
    %Inertial Moments.
        I_x             = 33730861.08e3     %**** kg*m^2
        I_y             = 13826446202.68e3  %**** kg*m^2
        I_z             = 13826555274.94e3  %**** kg*m^2 
  
    end
end

%Caption:
    %**** means that isn't the right value yet.
