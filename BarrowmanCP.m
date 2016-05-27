%% 6DoF Simulation 
%Authors: Gabriel Bitencourt de A. Moura, Gustavo Iha R. Moraes
%Version 1.0.0

%% Barrowman's method to calculate Rocket's CP. 
classdef BarrowmanCP 
    properties
        OGIVE_LENGTH = 340*10^(-3);                  % m
        OGIVE_BASE_DIAMETER = 12.5*10^(-3);          % m
        d_F = 12.5*10^(-3);                          % Diâmetro da frente da transição (m)
        d_R = 2*50.80*10^(-3);                 % Diâmetro de trás da transição (m)
        L_T = 100*10^(-3);                  % Comprimento da transição
        X_P = 640*10^(-3);                  % Distância da ponta da ogiva até a frente da transição
        
        R = 50.80*10^(-3);                     % Raio do fim do corpo
        X_R = 1640*10^(-3) - 270*10^(-3);                   % Distância da ponta superior da aleta à ponta da base que toca o corpo
        X_B = 85*10^(-3);                  % Distância da ponta da ogiva à ponta superior da aleta que toca a fuselagem
        
        %% Fins
        FINS = 4;                                   %Number of fins
        C_R = 270*10^(-3);                          % Corda da raiz da aleta
        C_T = 100*10^(-3);                          % Corda da ponta da aleta
        FIN_LENGTH =  90*10^(-3);                   % Comprimento da aleta
        L_F = 90*10^(-3);                           % Corda da raiz do meio da aleta
    end
    
    methods
    end
    
end

%For now, this class has all rocket's datas based on UFABCRocket's
%Simulator. Then we'll propbably change the values for another one.

