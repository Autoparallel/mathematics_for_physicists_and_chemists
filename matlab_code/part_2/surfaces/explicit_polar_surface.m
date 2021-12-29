clear all;
% Settings
delta_theta = 0.005;
delta_r = 0.01;
theta_min = 0;
theta_max = 2*pi;
r_min = -1;
r_max = 1;

%Generate the Polar angle vector containing information about sector location and angle
Theta = [theta_min:delta_theta:theta_max+delta_theta];  
%Generate the Radius vector
R = [r_min:delta_r:r_max+delta_r];
%Create a grid from angle and Radius
[ThetaG,RG] = meshgrid(Theta,R);
%Create X,Y matrices calculated on grid.
% X = RG.*cos(ThetaG);
% Y = RG.*sin(ThetaG);
R = 5;
X = (R+RG.*cos(.5*ThetaG)).*cos(ThetaG);
Y = (R+RG.*cos(.5*ThetaG)).*sin(ThetaG);
f = RG.*sin(.5*ThetaG);

h = surf(X,Y,f,'EdgeColor','none',...
    'FaceAlpha',.75);
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

set(gca,'TickLabelInterpreter','latex')
xlabel('$x$', 'interpreter','latex')
ylabel('$y$', 'Interpreter', 'latex')
zlabel('$f(x,y)$', 'Interpreter', 'latex')