%% 6DoF Simulation 
% Authors: Gabriel Bitencourt de A. Moura, Gustavo Iha R. Moraes
% Version 1.0.0

%% Barrowman's method to calculate Rocket's CP. 
classdef BarrowmanCP 
    
    properties (Constant)
        %% Ogive(NOSE)
        OGIVE_LENGTH = 340*10^(-3);                             % Lenght of the ogive (m)
        OGIVE_BASE_DIAMETER = 12.5*10^(-3);                     % Diameter at the base of the ogive (m)
        
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
    
    methods(Static)
        function CP = CalculateCP()
            %% Ogive 
            OGIVE_CP = 2;                                      % Based on the literature
            OgiveCP_Distance = 0.466*OGIVE_LENGHT;             % Calculates the distance from nose tip to ogive's cp
            
            %% Conical Transition
            Transition_cp = 2*((TRANSMITION_DIAMETER_REAR/OGIVE_BASE_DIAMETER)^2 - (TRANSMISSION_DIAMETER_FRONT/OGIVE_BASE_DIAMETER)^2);
            TransitionCP_Distance = DISTANCE_TIP_TRANSMISSION_FRONT + TRANSMISSION_LENGHT/3 * (1 + (1 - (TRANSMISSION_DIAMETER_FRONT/TRANSMISSION_DIAMETER_REAR))/(1 - (TRANSMISSION_DIAMETER_FRONT/(TRANSMISSION_DIAMETER_REAR)^2)));
            
            %% Fins
            Fin_cp = (1 + END_BODY_RADIUS/(END_BODY_RADIUS + FIN_LENGTH)) * (4*FINS*(FIN_LENGTH/OGIVE_BASE_DIAMETER)^2/(1 + (1 + (2*FIN_MID_CHORD_LENGTH/(FIN_ROOT_CHORD + FIN_TIP_CHORD))^2)^(1/2)));
            FinCP_Distance = DISTANCE_TIP_FIN + DISTANCE_MID_CHORD/3*(FIN_ROOT_CHORD + 2*FIN_TIP_CHORD)/(FIN_ROOT_CHORD + FIN_TIP_CHORD) + 1/6*(FIN_ROOT_CHORD + FIN_TIP_CHORD - (FIN_ROOT_CHORD*FIN_TIP_CHORD/(FIN_ROOT_CHORD + FIN_TIP_CHORD)));
            
            %% CP Determination
            Sum_cp = Transition_cp + OGIVE_CP + Fin_cp;
            CP = (OgiveCP_Distance*OGIVE_CP + TransitionCP_Distance*Transition_cp + Fin_cp*FinCP_Distance)/Sum_cp;
            
        end     
    end
end

% For now, this class has all rocket's datas based on UFABCRocket's
% Simulator. Then we'll propbably change the values for another one.

