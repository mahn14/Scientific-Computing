%% Problem 42

%a. implement function
%b. implement function

%c. Runge-Kutta
tspan = [0 10];
w0 = [1.5 0 0 0];
[t,w] = ode_rk4_classic(@fun42b, tspan, w0, 1000);

ans1 = [w(2,1) w(2,2) w(2,3) w(2,4)]';
ans2 = [w(8,1) w(8,2) w(8,3) w(8,4)]';

%{
%d. Plot x1 and x2
x = w(:,1);
y = w(:,3);
t = 0:0.01:10;
plot(t, x, 'b*', t, y, 'r*')
legend('x1', 'x2')
xlabel('t'); ylabel('x(t)');
title('Part D')
axis([0, 10, -1.6, 1.6]);
%}

%{
%e. Plot x1d and x2d
x = w(:,2);
y = w(:,4);
t = 0:0.01:10;
plot(t, x, 'b*', t, y, 'r*')
legend('x1d', 'x2d')
xlabel('t'); ylabel('xd(t)');
title('Part E')
axis([0, 10, -2.5, 2.5])
%}

%{
%f.
plot(w(:,1), w(:,3), 1.5, 0, 'r*')
title('Part F')
axis([-1.6, 1.6, -1.6, 1.6])
%}

%g.
g1 = fun42a(1, w(:,1), w(:,2), w(:,3), w(:,4));
g2 = fun42a(201, w(:,1), w(:,2), w(:,3), w(:,4));
g3 = fun42a(1001, w(:,1), w(:,2), w(:,3), w(:,4));
[g1 g2 g3]';

%h. Cubic Spline with Composite Integral for ARC LENGTH
xconds = [1 1]; yconds = [1, 1];
x_bc = [g1(1) w(:,2)' g3(1)];
y_bc = [g1(2) w(:,4)' g3(2)];
S_info_x = csape(t, x_bc, xconds);
S_info_y = csape(t, y_bc, yconds);
Sx = @(t) ppval(S_info_y, t);
Sy = @(t) ppval(S_info_x, t);

f = @(t) sqrt((Sx(t)).^2 + (Sy(t)).^2);

arclength = quadrature_comp(f, 0, 10, 1000, ...
    @quadrature_GL, 3);





