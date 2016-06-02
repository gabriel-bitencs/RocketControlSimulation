%% 6DoF Simulation 
% Authors: Gabriel Bitencourt de A. Moura, Gustavo Iha R. Moraes
% Version 1.0.0

%% Rocket Incial Conditions
classdef IntialConditions
    properties
        %% Physical 
        Position = [0,0,0];                      %[x,y,z] m
        LinearVelocity = [0,0,0];                %[u,v,w] m/s
        AngularVelocity = [0,0,0];               %[P,Q, R] rad/s 
        LinearAcceleration = [0,0,0];            %[u',v',w'] m/s^2
        AngularAcceleration = [0,0,0];           %[P',Q',R'] rad/s^2
        
        %% Euler's Angles (in degress) 
        Phi = 0;                                                     
        Psi = 0
        Theta = 0;
        
    end  
    
    methods (Static)       
        function Quarternion = CalculateQuaternions()
            % Returns the normalized quarternion vector from the initial euler's angles
            
            %% Calculates the quaternions' terms
            q_0 = cos(Phi/2)*cos(Tetha/2)*cos(Psi/2) - sin(Phi/2)*sin(Theta/2)*sin(Psi/2);
            q_1 = sin(Theta/2)*sin(Psi/2)*cos(Psi/2) + sin(Psi/2)*cos(Tetha/2)*cos(Phi/2);
            q_2 = sin(Theta/2)*cos(Psi/2)*cos(Phi/2) - sin(Psi/2)*sin(Psi/2)*cos(Theta/2);
            q_3 = sin(Phi/2)*cos(Psi/2)*cos(Tetha/2) + sin(Phi/2)*sin(Theta/2)*cos(Psi/2);
            
            %% Creates the quarternion vector and determinates it's norm
            QuaternionVector = [q_0, q_1, q_2, q_3];
            QuartenionNorm = norm(QuaternionVector);
            
            %% Normalizes the quaternion if it's necessary
            if(QuarternionNorm ~= 1)
                QuaternionVector = QuaternionVector/QuartenionNorm;
            end
            
            %% Return
            Quarternion = QuaternionVector;
            
        end
        
    end
    
    methods
        function TransformMatrix = Calcuate_TransformMatrix(Quaternion)
             
            %% Quanti
            a11 = Quaternion(1)^2 + Quaternion(2)^2 - Quaternion(3)^2 - Quaternion(4)^2;
            a12 = 2*(Quaternion(2)*Quaternion(3) - Quaternion(1)*Quaternion(4));
            a13 = 2*(Quaternion(2)*Quaternion(3) + Quaternion(1)*Quaternion(3));
            a21 = 2*(Quaternion(2)*Quaternion(3) + Quaternion(1)*Quaternion(4));
            a22 = Quaternion(1)^2 - Quaternion(2)^2 + Quaternion(3)^2 - Quaternion(4)^2;
            a23 = 2*(Quaternion(3)*Quaternion(4) - Quaternion(1)*Quaternion(2));
            a31 = 2*(Quaternion(2)*Quaternion(3) - Quaternion(1)*Quaternion(3));
            a32 = 2*(Quaternion(3)*Quaternion(4) + Quaternion(1)*Quaternion(2));
            a33 = Quaternion(1)^2 - Quaternion(2)^2 - Quaternion(3)^2 + Quaternion(4)^2;
            
            TransformMatrix = [a11 a12 a13; a21 a22 a23; a31 a32 a33];            
        end
    end
end

