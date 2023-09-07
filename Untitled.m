
% Define the time span for integration
t_span = [0, 10];

% Define the initial conditions [y_initial, x_initial]
y0 = [1e-5, 3e-7];

% Solve the system of ODEs using ode45 solver
[time_values, y_values] = ode45(@ode_system, t_span, y0);

% Extract the solution for x(t)
x_values = y_values(:, 2);