clear all;

% 2D Vector fields
%% Domain and function
x_min = -5;
x_max = 5;
y_min = -5;
y_max = 5;

[X,Y] = meshgrid(x_min:0.05:x_max,y_min:0.05:y_max);

% Vector field components
V1 = @(x,y) x;
V2 = @(x,y) y;

%% Plotting
number_of_arrows = 500;

quiverC2D(X,Y,V1(X,Y),V2(X,Y),1,number_of_arrows);
set(gca,'TickLabelInterpreter','latex');
set(gca, 'Color', 'white');
xlabel('$x$', 'interpreter','latex');
xlim([x_min x_max]) 
xticks([x_min:1:x_max]);
ylabel('$y$', 'Interpreter', 'latex');
ylim([y_min y_max]) 
yticks([y_min:1:y_max]);
%colorbar;
% h = colorbar;
% ylabel(h, 'length of vector', 'Interpreter', 'latex')
axis tight
axis equal