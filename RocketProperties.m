%% 6DoF Simulation 
% Authors: Gabriel Bitencourt de A. Moura, Gustavo Iha R. Moraes
% Version 1.0.0

classdef RocketProperties < handle
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
        
        %% Calculates rocket's speed and acceleration based on its Dynamics
        % NOT WORKING, BECAUSE ODE45 IN SIMULATOR CAN'T ACCESS THIS :(
        function eq = Dynamics(t, X)
            
            % Values obtained from integrator:
            
            % Position
            %x = X(1);
            %y = X(2);
            %z = X(3);
               
            % Linear Velocity
            V = [X(4) X(5) X(6)];
            
            % Angular Velocity
            w = [X(7) X(8) X(9)];
            
            % Quaternions
            Quaternions = [X(10) X(11) X(12) X(13)];
            
            % Force in inertial coordinate system (example)
            Force_Inertial = [50 200 0];
            
            dVdt = Force_Inertial / SimulatorConstants.Mass - cross(w,V);
            
            dwdt = [0 0 0];
            
            eq = [V(1); V(2); V(3); dVdt(1); dVdt(2); dVdt(3); dwdt(1); dwdt(2); dwdt(3)];
        end
        
        %% Returns the normalized Quaternion vector associated with the rocket's euler angles
        
        function Quarternion = Quaternion(obj)
            
            % Calculates the quaternions' terms
            %obj = RocketProperties;
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
        
        function TransformMatrix = TransformMatrix(obj)
            
            %obj = RocketProperties;
            Quaternion = obj.Quaternion;
            
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

