clear all;

normal = false;

%% Level surfaces
% Constant value
constant = 1;

% Function
f = @(x,y,z) x.^2 + y.^2 -constant; % do not remove '- constant'


%% Plot
% Set range
x_min = -10;
x_max = 10;
x_tick_length = 2;
y_min = -10;
y_max = 10;
y_tick_length = 2;
z_min = -10;
z_max = 10;
z_tick_length = 2;


interval = [x_min x_max ...
            y_min y_max ...
            z_min z_max];

% Create surface
fs = fimplicit3(f,interval, ...
    'FaceColor', '#abf226', ...
    'FaceAlpha', 0.6, ...
    'EdgeColor', 'none');
shading interp
lightangle(-45,30)
view(25,25)
if normal
    X = linspace(x_min, x_max, 100);
    Y = linspace(y_min, y_max, 100);
    Z = linspace(z_min, z_max, 100);
    [X,Y,Z] = meshgrid(X,Y,Z);
    fx = exp(X);
    fy = -2*Y;
    fz = -2*Z;
    quiverC3D(X,Y,Z,fx,fy,fz,.25,500, 'Normalize', true);
    
end

set(gca,'TickLabelInterpreter','latex')
xlabel('$x$', 'interpreter','latex')
xlim([x_min x_max]) 
xticks([x_min:x_tick_length:x_max]);
ylabel('$y$', 'Interpreter', 'latex')
ylim([y_min y_max]) 
yticks([y_min:y_tick_length:y_max]);
zlabel('$z$', 'Interpreter', 'latex')
zlim([z_min z_max]) 
zticks([z_min:z_tick_length:z_max]);