beta = [0.72; 864; 1.44; 43.2; 20000; 432; 0.06; 0.84e-3; 0.24e-5];
x0 = [120; 20; 1500];
tspan = 0:1000; 
[t,x] = ode45(@(t,x) chetan(t,x,beta),tspan,x0);
axlim = [min(x(:,1)) max(x(:,1))  min(x(:,2)) max(x(:,2))  min(x(:,3)) max(x(:,3))];
figure
hold on
grid on
view(-30,30)
for k = 1:numel(t)
    plot3(x(k,1),x(k,2),x(k,3),'.k','LineWidth',1.5);
    axis(axlim)
    drawnow
end
hold off
figure
plot(t,x)
grid