%% 6DoF Simulation 
%Authors: Gabriel Bitencourt de A. Moura, Gustavo Iha R. Moraes
%Version 1.0.0

%% Barrowman's method to calculate Rocket's CP. 
classdef BarrowmanCP 
    properties
        %% Ogive(NOSE)
        OGIVE_LENGTH = 340*10^(-3);                             % m
        OGIVE_BASE_DIAMETER = 12.5*10^(-3);                     % m
        
        %% Transmission
        TRANSMISSION_DIAMETER_FRONT = 12.5*10^(-3);             % Diameter at Front of Transmission (m)
        TRANSMITION_DIAMETER_REAR = 2*50.80*10^(-3);            % Diameter at Rear of Transmission  (m)
        TRANSMISSION_LENGHT = 100*10^(-3);                  
        
        %% Distances
        DISTANCE_MID_CHORD = 1640*10^(-3) - 270*10^(-3);        % Distance between fin root leading edge and fin tip leading edge parallel to body
        DISTANCE_TIP_FIN = 85*10^(-3);                          % Distance from nose Tip to Fin root chord leading edge
        DISTANCE_TIP_TRANSMISSION_FRONT = 640*10^(-3);          % Distance from nose tip to front of Transmission
        
        %% Fins
        FINS = 4;                                               % Number of fins
        FIN_TIP_CHORD = 270*10^(-3);                            % Fin root chord
        FIN_ROOT_CHORD = 100*10^(-3);                           % Fin tip chord
        FIN_LENGTH =  90*10^(-3);                               % Lenght of Fins
        FIN_MID_CHORD_LENGTH = 90*10^(-3);                      % Length of fin mid-chord line
        
         %% Others
        END_BODY_RADIUS = 50.80*10^(-3);                        % Radius of Body at aft End
        
    end
    
    methods
    end
    
end

%For now, this class has all rocket's datas based on UFABCRocket's
%Simulator. Then we'll propbably change the values for another one.

