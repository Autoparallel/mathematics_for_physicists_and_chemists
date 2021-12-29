clear all; close all; clc;

%% Domain and function
% Set up the domain and function

% Domain
x_min = -2;
x_max = 2;
y_min = -2;
y_max = 2;
[X,Y]=meshgrid(x_min:0.01:x_max,...
    y_min:0.01:y_max); % 0.25 denotes arrow spacing.
[X_arrow,Y_arrow] = meshgrid(x_min:0.5:x_max,...
    y_min:0.5:y_max);

% Function
f = @(x,y) sin(x.^2)-cos(y.^3);

% Gradient
fx = @(x,y) 2*x;
fy = @(x,y) -(3)*y.^2;

%% Plotting

gradient = false; % turn on to show gradient vectors

hold on;
%constants = [0 1 2 3];
constants = linspace(0,5,20);
%[C,h] = contourf(X,Y,f(X,Y),constants,'Showtext', 'on'); 
[C,h] = contour(X,Y,f(X,Y),constants,'Showtext', 'off');
h.LineWidth = 1.5;
%clabel(C,h);
if gradient
    quiver(X_arrow, Y_arrow, fx(X_arrow,Y_arrow), fy(X_arrow,Y_arrow),...
    'Color', 'white',...
    'Linewidth', 1);
end
hold off;

%coloring
%number_of_colors = 10;
%colormap(cool(number_of_colors));
%colorbar;

% Text
set(gca,'TickLabelInterpreter','latex');
%title('$f(x,y) = \sqrt{x^2+y^2}$',...
%'interpreter', 'latex');
xlabel('$x$', 'interpreter','latex');
xlim([x_min x_max]) 
xticks([x_min:1:x_max]);
ylabel('$y$', 'Interpreter', 'latex');
ylim([y_min y_max]) 
yticks([y_min:1:y_max]);