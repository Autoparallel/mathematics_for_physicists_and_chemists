clear all;

% If you choose to frame the curve, make radius small.
% See settings below.
frame = true; % true will build the Tangent and Normal vectors to the curve


%% Curve parameters
% Discretization
steps = 1000;

% Time
t_start = 0;
t_end = 2*pi;
t=linspace(t_start,t_end,steps);

% Curve components
x = cos(t)
y = sin(t)
z = t-t;

% Build curve
curve_parameterization = [x; y; z];


%% Thickening and framing settings
radius = 0.005; % radius of tube, 0.05 standard 
%(smaller is better for frames, e.g., 0.01)
numpoints = 50; % number of points along circumference
collapse_threshold = radius;

%% Frame settings
down_sampling = 15; % increase to reduce the amount of arrows shown


%% Plotting
hold on;
tube_plot(curve_parameterization,radius,numpoints,collapse_threshold,t);

% Framing
if frame
    [T,N,B,kappa,tau] = TNB(x,y,z);
    frame_plot(x,y,z,T,N,down_sampling);
end
hold off;

%% Visualization
% Plot bounds and ticks
x_min = -8;
x_max = 8;
x_tick_length = 2;

y_min = -8;
y_max = 8;
y_tick_length = 2;

z_min = -8;
z_max = 8;
z_tick_length = 2;

% Lighting and view
daspect([1,1,1]);
camlight;
view(25,25);

% Plot labeling
set(gca,'TickLabelInterpreter','latex')
%xlabel('$x$', 'interpreter','latex')
xlabel('Real Part', 'interpreter','latex')
xlim([x_min x_max]) 
xticks([x_min:x_tick_length:x_max]);
%ylabel('$y$', 'Interpreter', 'latex')
ylabel('Imaginary Part', 'Interpreter', 'latex')
ylim([y_min y_max]) 
yticks([y_min:y_tick_length:y_max]);
zlabel('$z$', 'Interpreter', 'latex')
zlim([z_min z_max]) 
zticks([z_min:z_tick_length:z_max]);
axis equal;
%colorbar;
%Green to red colormap
cMap = interp1([0;1],[0 1 0; 1 0 0],linspace(0,1,256));
colormap(cMap);
grid on;
