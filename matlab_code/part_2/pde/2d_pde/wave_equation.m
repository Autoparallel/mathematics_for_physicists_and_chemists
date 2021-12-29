clc; clear all; close all;
%2D WAVE EQUATION utt = c^2(uxx+uyy) 
%with initial condition  u(x,y,0) = sin(p*pi*x)*sin(q*pi*y), 0<x<1 0<y<1
% and boundary conditions u(0,y,t) = u(1,y,t)= u(x,0,t)= u(x,1,t) = 0 t>0
c = 1;  
dx = 0.01;
dy = dx;
sigma = 1/sqrt(2); gamma = 1/sqrt(2); %Courant-Friedrich Stability Condition
dt = sigma*(dx/c);
t = 0:dt:3; x = 0:dx:1; y = 0:dy:1; 
u = zeros(length(x),length(y),length(t));
p = 1; q = 1;
u(:,:,1) = transpose(sin(p.*pi.*x))*sin(q.*pi.*y); x'*y; %u(x,y,0) = sin(p*pi*x)*sin(q*pi*y)
%u(x,y,dt)
for i=2:length(x)-1 
    for j=2:length(y)-1
     u(i,j,2)= (sigma^2)*(u(i+1,j,1)-2*u(i,j,1)+u(i-1,j,1))...
         +(gamma^2)*(u(i,j+1,1)-2*u(i,j,1)+u(i,j-1,1))+2*u(i,j,1) - u(i,j,1); 
    end
end
for n=2:length(t)-1
    for i=2:length(x)-1
        for j=2:length(y)-1
            u(i,j,n+1)= (sigma^2)*(u(i+1,j,n)-2*u(i,j,n)+u(i-1,j,n))...
                +(gamma^2)*(u(i,j+1,n)-2*u(i,j,n)+u(i,j-1,n)) + 2*u(i,j,n) - u(i,j,n-1);
        end
    end
end

[X,Y] = meshgrid(x,y);
for j=1:length(t)

       colormap(cool);
       p1 = surf(X,Y,u(:,:,j)); 
       title(sprintf('$t =$ %1.2f',t(j)),'Interpreter', 'latex');
       set(gca,'TickLabelInterpreter','latex')
       xlabel('$x$','Interpreter', 'latex');
       ylabel('$y$','Interpreter', 'latex');
       zlabel(sprintf('$u(x,y,t =$ %1.2f)',t(j)),'Interpreter', 'latex');
       axis ([0 1 0 1 -1 1]);
       pause(0.01);
end