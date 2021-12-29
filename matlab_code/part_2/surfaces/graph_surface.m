%% Graph surface

% Display normals
normal = false;

% display level curves
%https://www.mathworks.com/matlabcentral/answers/433972-how-to-overlay-gradient-on-surface-plot

%display gradient
% TODO

x = 0 : .005 : 1;
y = 0 : .005 : 1;
[X,Y]=meshgrid(x,y);
n = 1;
m = 1;
t = 0.1;
% Function
f = @(x,y) sin(m*pi*x).*sin(n*pi*y).*exp(-2*pi^2*t);

Z = f(X,Y);

%% Plotting

hold on;
h = surf(X,Y,Z,'EdgeColor',...
    'none','FaceAlpha',.75);
shading interp
lightangle(-45,30)
h.FaceLighting = 'gouraud';
h.AmbientStrength = 0.3;
h.DiffuseStrength = 0.8;
h.SpecularStrength = 0.9;
h.SpecularExponent = 25;
h.BackFaceLighting = 'unlit';
colormap(hot);
view(25,25)

if normal
    [U,V,W] = surfnorm(X,Y,Z);
    quiverC3D(X,Y,Z,U,V,W,.25,100, 'Normalize', true);
end
hold off;

set(gca,'TickLabelInterpreter','latex')
title('$u_{11}(x,y,0.1)$', 'Interpreter', 'latex')
xlabel('$x$', 'interpreter','latex')
xlim([0 1])
ylabel('$y$', 'Interpreter', 'latex')
ylim([0 1])
%zlabel('$u_{55}(x,y,0)$', 'Interpreter', 'latex')
zlim([-1 1])
cb = colorbar;
caxis([-1,1])
set(cb, 'YTick', [-1 : 0.5 : 1])