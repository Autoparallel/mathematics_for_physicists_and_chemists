clear all;
%3D VECTOR FIELDS

%% Domain and function
x_min = -1.5;
x_max = 1.5;
y_min = -1.5;
y_max = 1.5;
z_min = 0;
z_max = 2.5;

[X,Y,Z] = meshgrid(x_min:0.05:x_max,...
    y_min:0.05:y_max,...
    z_min:0.05:z_max);

% Vector field components
V1 = @(x,y,z) -y;
V2 = @(x,y,z) x;
V3 = @(x,y,z) .25*z;


%% Plotting
hold on;
quiverC3D(X,Y,Z,V1(X,Y,Z),V2(X,Y,Z),V3(X,Y,Z),1,250);
hold off;
view(45,45);
set(gca, 'Color', 'white');
axis tight
axis equal
daspect([1,1,1]);
camlight;
set(gca,'TickLabelInterpreter','latex')
xlabel('$x$', 'Interpreter','latex')
ylabel('$y$', 'Interpreter', 'latex')
zlabel('$z$', 'Interpreter', 'latex')
colormap(cool);
grid on;
%colorbar;
% h = colorbar;
% ylabel(h, 'length of vector');