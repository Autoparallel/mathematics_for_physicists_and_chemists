clear all; clc; close all;

%% Parameters
n = 26; % Number of particles
animate = true;

%% Domain information
x_1 = 0; % Position of first particle
x_n = pi; % Position of last particle
x = linspace(x_1 ,x_n ,n );
delta_x = abs(x_n-x_1)/n;

%% Time information
t_0 = 0; %start
t_1 = 2; %end
fineness = 1000;
tmesh = linspace(t_0,t_1,fineness);
realtime = (t_1-t_0)/fineness;

%% Conductivity of the medium
% k = x-x; %none k=0
% k = x-x+0.1; %low
k = x-x+5; %high

%% Sources
%f = x-x; % no sources
%f = cos(10*x); % smooth spaced sources

% center source
f = x-x;
f(n/2)=1;

%edge source
% f = x-x;
% f(n)=1;


%% Initial condition
u_0 = x-x; %equal temp
% u_0 = x+sin(x)+sin(2*x)+sin(3*x); % warm center cool edges
% u_0 = 0.1*sin(x);

% Heat kernel choice
% u_0 = x-x;
% u_0(n/2)=1;

%% Set up ODE right hand side
F = @(t,u) heat_equation_neumann(t,u,k,f,n,delta_x);

%% Solve ODE
[t,xa] = ode45(F, tmesh, u_0); 

%% Plotting
if animate
    for i = 1:length(t)-1
        s = plot(x,xa(i,1:n)',...
            'Color',[0,0,0],...
            'LineStyle',':',...
            'Marker','o',...,
            'MarkerFaceColor', [0,0,0],...
            'MarkerIndices',1:1:length(xa(i,1:n)),...
            'LineWidth',2);
        xlim([x_1 x_n])
        ylim([min(min(xa)) max(max(xa))]);
        set(gca,'TickLabelInterpreter','latex')
        xlabel('$x$', 'Interpreter', 'latex');
        ylabel('$u(x,t)$', 'Interpreter', 'latex');
        s.XData = x;    % replace surface x values
        s.YData = xa(i+1,1:n)';    % replace surface y values
        title('time $t=$', t(i), 'Interpreter', 'latex');
        pause(realtime)     % pause to control animation speed
    end
else
h = surf(t,x,xa', 'EdgeColor','none','FaceAlpha',1);
shading interp
lightangle(0,90)
h.FaceLighting = 'gouraud';
h.AmbientStrength = 0.3;
h.DiffuseStrength = 0.8;
h.SpecularStrength = 0.9;
h.SpecularExponent = 25;
h.BackFaceLighting = 'unlit';
colormap(hot)
colorbar
set(gca,'TickLabelInterpreter','latex')
xlabel('$t$', 'Interpreter', 'latex');
xlim([t_0 t_1]);
ylabel('$x$', 'Interpreter', 'latex');
ylim([x_1 x_n]);
zlabel('u(x,t)', 'Interpreter', 'latex');
view(45,45);
end