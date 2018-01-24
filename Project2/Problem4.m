% Problem 4

%% a.) Reduce to 1st order: find G and w0
a=1; b=2;
b1= 0.9; b2 = -0.8;
y1 = -3.6; y2 = 3.3;
w0 = [b1 b2 y1 y2]';

f_fun = @(x, u, ud, udd, uddd) 32*cos(x)*sin(x) - 2*cos(cos(2*x))*sin(cos(2*x)) + ...
    sin(ud);
G = @(x,w) [w(2) w(3) w(4) f_fun(x, w(1), w(2), w(3), w(4))]';

%% b.) Solve the IVP using ode_rk33

xspan = [a b]; 
[x,w] = ode_rk33(G, xspan, w0, 100);
u = w(:,1); ud = w(:,2); udd = w(:,3); uddd = w(:,4);
b_1 = find(x == 1.22);
b_2 = find(x == 1.67);

answer_b = [u(b_1) u(b_2); ud(b_1) ud(b_2); udd(b_1) udd(b_2); ...
    uddd(b_1) uddd(b_2)];

%% c.) Implement the Function and Use

a = 1; b = 2;
b1 = 0.1; b2 = 0.15; b3 = 0.2; b4 = 0.25;
y = [0.1 0.3]';
Nh = 100;

f_fun2 = @(x, u, ud, udd, uddd) 32.*cos(x).*sin(x) - ...
    2.*cos(udd).*sin(u) + sin(ud);

F = two_point_ShMeth_beam_nonlinearF(y, f_fun2, a, b, ...
    b1, b2, b3, b4, Nh);

%% d.) Solve the BVP

y0 = [0.1; 0.3]; EPS = 10^(-6);
Nh = 100;

G = @(x, w) [w(2) w(3) w(4) ... 
    f_fun2(x, w(1), w(2), w(3), w(4))]';
w0 = [b1 b2 y(1) y(2)]';
[x,w] = ode_rk33(G, xspan, w0, Nh);
u = w(:,1); ud = w(:,2); udd = w(:,3); uddd = w(:,4);

B0 = approxJ_compl(f_fun2, y0, EPS, ...
    u(end), ud(end), udd(end), uddd(end));

tol = 10^(-12); nmax = 200;
[u1, res, niter] = broyden(@two_point_ShMeth_beam_nonlinearF, ...
    B0, y0, tol, nmax, f_fun2, a, b, b1, b2, b3, b4, Nh);

G_d = @(x, w) [w(2) w(3) w(4) f_fun2(x, w(1), w(2), w(3), w(4))]';
w0 = [b1 b2 u1(1) u1(2)]';
[x, w] = ode_rk33(G_d, xspan, w0, 100);
u = w(:, 1); ud = w(:, 2); udd = w(:,3); uddd = w(:,4);
i = find(x == 1.22);
i2 = find(x == 1.67);

answer_d = ...
    [u(i) u(i2); ud(i) ud(i2); ...
    udd(i) udd(i2); uddd(i) uddd(i2)];


    







