%% 6DoF Simulation 
% Authors: Gabriel Bitencourt de A. Moura, Gustavo Iha R. Moraes
% Version 1.0.0

classdef RocketProperties
    % An object initialized from this class will contain all the
    % information related with the rocket, such as velocity, acceleration
    % or orientation vectors.
    
    %% Rocket properties
    properties
        % Physical 
        Position = [0,0,0];                      %[x,y,z] m
        LinearVelocity = [0,0,0];                %[u,v,w] m/s
        AngularVelocity = [0,0,0];               %[P,Q,R] rad/s 
        LinearAcceleration = [0,0,0];            %[u',v',w'] m/s^2
        AngularAcceleration = [0,0,0];           %[P',Q',R'] rad/s^2
        
        % Euler's Angles (in degrees) 
        Phi = 0;                                                     
        Psi = 0;
        Theta = 0;
        
    end  
    
    %% Class Methods
    
    methods
        
        %% Returns the normalized Quaternion vector associated with the rocket's euler angles
        
        function Quarternion = CalculateQuaternions(~)
            
            % Calculates the quaternions' terms
            obj = RocketProperties; 
            q_0 = cos(obj.Phi/2)*cos(obj.Theta/2)*cos(obj.Psi/2) - sin(obj.Phi/2)*sin(obj.Theta/2)*sin(obj.Psi/2);
            q_1 = sin(obj.Theta/2)*sin(obj.Psi/2)*cos(obj.Psi/2) + sin(obj.Psi/2)*cos(obj.Theta/2)*cos(obj.Phi/2);
            q_2 = sin(obj.Theta/2)*cos(obj.Psi/2)*cos(obj.Phi/2) - sin(obj.Psi/2)*sin(obj.Psi/2)*cos(obj.Theta/2);
            q_3 = sin(obj.Phi/2)*cos(obj.Psi/2)*cos(obj.Theta/2) + sin(obj.Phi/2)*sin(obj.Theta/2)*cos(obj.Psi/2);
            
            % Creates the quarternion vector and determines its norm
            QuaternionVector = [q_0, q_1, q_2, q_3];
            QuaternionNorm = norm(QuaternionVector);
            
            % Normalizes the quaternion if it's necessary and different
            % than zero
            if(QuaternionNorm ~= 1 && QuaternionNorm ~= 0)
                QuaternionVector = QuaternionVector/QuaternionNorm;
            end
            
            % Return
            Quarternion = QuaternionVector;
            
        end      
    
        %% Returns the transformation matrix from inertial coordinate system to the rocket's.
    
        function TransformMatrix = CalculateTransformMatrix(~,Quaternion)
            % Generates Transform Matrix from the quaternions' vector
             
            % Quantifies terms of Transform Matrix
            a11 = Quaternion(1)^2 + Quaternion(2)^2 - Quaternion(3)^2 - Quaternion(4)^2;
            a12 = 2*(Quaternion(2)*Quaternion(3) - Quaternion(1)*Quaternion(4));
            a13 = 2*(Quaternion(2)*Quaternion(3) + Quaternion(1)*Quaternion(3));
            a21 = 2*(Quaternion(2)*Quaternion(3) + Quaternion(1)*Quaternion(4));
            a22 = Quaternion(1)^2 - Quaternion(2)^2 + Quaternion(3)^2 - Quaternion(4)^2;
            a23 = 2*(Quaternion(3)*Quaternion(4) - Quaternion(1)*Quaternion(2));
            a31 = 2*(Quaternion(2)*Quaternion(3) - Quaternion(1)*Quaternion(3));
            a32 = 2*(Quaternion(3)*Quaternion(4) + Quaternion(1)*Quaternion(2));
            a33 = Quaternion(1)^2 - Quaternion(2)^2 - Quaternion(3)^2 + Quaternion(4)^2;

            % Building and returning Transform Matrix
            TransformMatrix = [a11 a12 a13; a21 a22 a23; a31 a32 a33];  
            
        end
    end
end

