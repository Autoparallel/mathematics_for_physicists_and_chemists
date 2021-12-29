%% Explicit surface

% Display normals
normal = false;

% display level curves
%https://www.mathworks.com/matlabcentral/answers/433972-how-to-overlay-gradient-on-surface-plot

%display gradient
% TODO

u = 0 : .01 : 2*pi+0.01;
v = -.5 : .01 : .5;
[u, v]=meshgrid(u,v);

% Function
x = (1+v.*cos(u/2)).*cos(u);
y = (1+v.*cos(u/2)).*sin(u);
z = v.*sin(u/2);

%% Plotting

hold on;
h = surf(x,y,z,'EdgeColor',...
    'none','FaceAlpha',.75);
shading interp
lightangle(-45,30)
h.FaceLighting = 'gouraud';
h.AmbientStrength = 0.3;
h.DiffuseStrength = 0.8;
h.SpecularStrength = 0.9;
h.SpecularExponent = 25;
h.BackFaceLighting = 'unlit';
colormap(cool);
view(25,25)

if normal
    [U,V,W] = surfnorm(X,Y,Z);
    quiverC3D(X,Y,Z,U,V,W,.25,100, 'Normalize', true);
end
hold off;

set(gca,'TickLabelInterpreter','latex')
xlabel('$x$', 'interpreter','latex')
ylabel('$y$', 'Interpreter', 'latex')
zlabel('$f(x,y)$', 'Interpreter', 'latex')
