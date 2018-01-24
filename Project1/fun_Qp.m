function f = fun_Qp(x, gam, c, z)

%parameters conversions
f = zeros(4, 1);
y = gam;
Q1 = x(1);
Q2 = x(2);
Q3 = x(3);
p = x(4);

%vector function
f(1) = Q1 +Q2 + Q3;
f(2) = p/y + c(1)*sign(Q1)*Q1^2 + z(1);
f(3) = p/y + c(2)*sign(Q2)*Q2^2 + z(2);
f(4) = p/y + c(3)*sign(Q3)*Q3^2 + z(3);

end