%% Set up
% Gride size
dx = 0.01;
dy = dx;
dt = 0.001;
% Grid
t = 0:dt:5;
x = 0:dx:2*pi; 
y = 0:dy:2*pi; 

% Right-Hand Side (RHS)
f = sin(x*y);

% PDE type
equation = 'heat';

%% Solve PDE

% Green's function
green_function = getGreenFunction(equation);

% Solution
u = zeros(length(x),length(y),length(t));

% Convolve RHS with the Green's function
u = convolve(f);
