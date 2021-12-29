%% Level points
%Set up domain and function
x_min = -5;
x_max = 5;
y_min = -1;
y_max = 5;

x = -3:.05:3;
y = abs(x);
z= zeros(size(x));

hold on;
surface([x;x],[y;y],[z;z],[y;y],...
        'facecol','no',...
        'edgecol','interp',...
        'linew',2);

set(gca,'TickLabelInterpreter','latex');
xlabel('$x$', 'interpreter','latex');
xlim([x_min x_max]);
xticks([x_min:1:x_max]);
ylabel('$y$', 'Interpreter', 'latex');
ylim([y_min y_max]);
yticks([y_min:1:y_max]);
colormap(cool(3));

%
constant = 3;
x_values = [-constant constant];
y_values = [constant constant];
col = y;


labels = {'$(-3,3)$', '$(3,3)$'};
plot(x_values,y_values,'o','LineWidth',...
    2, 'Color', '#000000');
text(x_values(1),y_values(1),labels(1),'VerticalAlignment','top',...
    'HorizontalAlignment','right',...
    'Interpreter', 'latex')
text(x_values(2),y_values(2),labels(2),'VerticalAlignment','top',...
    'HorizontalAlignment','left',...
    'Interpreter', 'latex')