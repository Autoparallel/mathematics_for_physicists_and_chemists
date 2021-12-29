function [du] = wave_equation_clamp(t,state,k,f,n,delta_x)
k = k/delta_x^2;
du(1) = state(n+1);
du(n+1) = 0;
du(n) = state(2*n);
du(2*n) = 0;

for j = 2 : n-1
    du(j) = state(n+j);
    du(n+j) = -k(j-1)*(state(j)-state(j-1))+k(j)*(state(j+1)-state(j))+f(j);
end

du = du';