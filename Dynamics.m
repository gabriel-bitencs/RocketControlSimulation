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
        %Quaternions = [X(10) X(11) X(12) X(13)];

        % Force in inertial coordinate system (example)
        Force_Inertial = [50 200 0];

        dVdt = Force_Inertial / SimulatorConstants.Mass - cross(w,V);

        dwdt = [0 0 0];

        eq = [V(1); V(2); V(3); dVdt(1); dVdt(2); dVdt(3); dwdt(1); dwdt(2); dwdt(3)];
end
