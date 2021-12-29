function [du] = heat_equation(t,u,k,f,n,delta_x)
k = k/delta_x^2;
du(1) = -k(1)*u(1) + k(1)*u(2) + f(1);
du(n) = +k(n-1)*u(n-1) - k(n-1)*u(n) + f(n);
for j = 2 : n-1
   du(j) = -k(j-1)*u(j) - k(j)*u(j) + k(j-1)*u(j-1) + k(j)*u(j+1) + f(j);
end
du = du';
end
