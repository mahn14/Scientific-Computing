%% Problem 27: Interpolating polnomial

%a.) Interpolation Plot
k = 1.5;
delta = [3.52, 3.62, 3.65, 3.52, 3.47, 3.25, 3.15, 3.15, 3.2, 3.27, 3.52, 3.7, 3.7];
delta = fliplr(delta);

x_nodes = [-55, -45, -35, -25, -15, -5, 5, 15, 25, 35, 45, 55, 65];

p = @(t) lagrange_interp(t, x_nodes, delta, 0);

x = -55:0.01:65;
y = p(x);
xx = linspace(x_nodes(1), x_nodes(end), 1000);
yy = p(xx);

plot(xx, yy);
grid on
axis([-60, 70, 2.2, 4])

%b.) Estimating Values
x_est = [-50, -20, -10, 0, 10, 17];
y_est = p(x_est)';

%c.) Cubic Splines
x = x_nodes;
y = delta;
conds = [1 1];
d1 = 0.003979604851107; d2 =-0.010471912543415;
y_with_bc = [d1 y d2];
Sc_info = csape(x, y_with_bc, conds);
Sc = @(x) ppval(Sc_info, x);%% Evalue the cubic spline function at x = 4.5Sn(4.5)
figure(1); clf;
xx = x(1):0.01:x(end); 
yy = Sc(xx);
plot(xx, yy, x, y, 'r*'); grid on;axis([-60, 70, 2.2, 4]);

%d.) estimating spline

est_spline = [Sc(-50), Sc(-20), Sc(-10), Sc(0), Sc(10), Sc(17)]';