function [outputArg1,outputArg2] = normal(inputArg1,inputArg2)
clear all;
%3D VECTOR FIELDS

%% Domain and function
x_min = -3;
x_max = 3;
y_min = -2;
y_max = 2;
z_min = -2;
z_max = 2;

[X,Y,Z] = meshgrid(x_min:0.05:x_max,...
    y_min:0.05:y_max,...
    z_min:0.05:z_max);

% Vector field components
V1 = @(x,y,z) (sin(x.*y.*z)-y-z)./(x.^2+y.^2+z.^2+1);
V2 = @(x,y,z) (cos(x.*y.*z)+x-z)./(x.^2+y.^2+z.^2+1);
V3 = @(x,y,z) z./(x.^2+y.^2+z.^2+1);

%% Plotting
hold on;
quiverC3D(X,Y,Z,V1(X,Y,Z),V2(X,Y,Z),V3(X,Y,Z),1,500);
% hold off;
% view(0,90);
% set(gca, 'Color', 'white');
% axis tight
% axis equal
% daspect([1,1,1]);
% camlight;
% view(25,35);
%colorbar;
% set(gca,'TickLabelInterpreter','latex')
% xlabel('$x$', 'Interpreter','latex')
% ylabel('$y$', 'Interpreter', 'latex')
% zlabel('$z$', 'Interpreter', 'latex')
colormap(cool);
% colorbar;
% h = colorbar;
% ylabel(h, 'length of vector');
end

