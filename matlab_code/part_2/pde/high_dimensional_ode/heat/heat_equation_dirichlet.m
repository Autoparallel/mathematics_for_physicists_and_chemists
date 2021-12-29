function [du] = heat_equation_dirichlet(t,u,k,f,n,delta_x)
k = k/delta_x^2;
du(1) = 0;
du(n) = 0;
for j = 2 : n-1
   du(j) = -k(j-1)*u(j) - k(j)*u(j) + k(j-1)*u(j-1) + k(j)*u(j+1) + f(j);
end
du = du';
end

