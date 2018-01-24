function J = fun_QpJ(x, gam, c, z)

%setting parameters
J = zeros(4, 4);
y = gam;
Q1 = x(1);
Q2 = x(2);
Q3 = x(3);

%Jacobian Matrix
J(1,1) = 1; J(1,2) = 1; J(1,3) = 1;

J(2,1) = 2*c(1)*sign(Q1)*Q1;
J(2,4) = 1/y;

J(3,2) = 2*c(2)*sign(Q2)*Q2;
J(3,4) = 1/y;

J(4,3) = 2*c(3)*sign(Q3)*Q3;
J(4,4) = 1/y;

end




