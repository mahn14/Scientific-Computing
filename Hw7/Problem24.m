%% Problem 24: Lagrange Characteristic Polynomial

%a.) characteristic with nodes
x_nodes = [-55, -25, 5, 35, 65];

a = lagrange_char(7, x_nodes, 2, 0);
b = lagrange_char(7, x_nodes, 2, 1);

c = lagrange_char(7, x_nodes, 5, 0);
d = lagrange_char(7, x_nodes, 5, 1);


%b.) interpolation
x = [-55, -25, 5, 35, 65];
y = [-3.25, -3.2, -3.02, -3.32, -3.1];

ans1 = lagrange_interp(20.5, x, y, 0);
ans2 = lagrange_interp(20.5, x, y, 1);