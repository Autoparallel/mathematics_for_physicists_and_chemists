%% Create rotational vector field

[x,y] = meshgrid(-3:0.3:3,-3:0.3:3);
quiver(x,y,-y,x)
xlim([-3 3])
ylim([-3 3])