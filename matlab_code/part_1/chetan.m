function dx = chetan(t,x,beta)
dx = [
    beta(2)-(beta(3)+beta(1)*x(2))*x(1);
    (x(3)*beta(4)*(x(1)^2)/(beta(5)+(x(1)^2)))-beta(6)*x(2);
    (-beta(7)+beta(8)*x(1)-beta(9)*(x(1)^2))*x(3);
    ];
end