% Parameters
L = 1;          % Length of the rod
T0 = 100;       % Initial temperature of the rod
T_left = 200;   % Temperature at the left end
T_right = 0;    % Temperature at the right end
alpha = 0.01;   % Thermal diffusivity
dx = 0.1;       % Spatial step size
dt = 0.01;      % Time step size
t_end = 1;      % End time of simulation

% Number of spatial points
Nx = L / dx + 1;
x = linspace(0, L, Nx);

% Initial temperature distribution
T = T0 * ones(1, Nx);

% Number of time steps
Nt = t_end / dt;

% Finite Difference Method
for t = 1:Nt
    % Compute temperature at inner points
    for i = 2:Nx-1
        T(i) = T(i) + alpha * dt * (T(i+1) - 2*T(i) + T(i-1)) / dx^2;
    end
    
    % Boundary conditions
    T(1) = T_left;
    T(Nx) = T_right;
end

% Plot the temperature distribution
plot(x, T);
xlabel('Position (m)');
ylabel('Temperature (°C)');
title('Temperature Distribution in the Rod');
