f_fun = @(x, u, ud, udd, uddd) 32.*cos(x).*sin(x) - 2.*cos(udd).*sin(u) ...
    + sin(ud);
a = 1; b = 2; b1 =0.1; b2 = 0.15; b3 = 0.2; b4 =0.25;
y = [0.1; 0.3];
Nh = 100;

F = two_point_ShMeth_beam_nonlinearF(y, f_fun, a, b, ...
b1, b2, b3, b4, Nh);
y0 = [0.1; 0.3]; EPS = 10^(-6);
G = @(x, w) [w(2); w(3); w(4); f_fun(x, w(1), w(2), w(3), w(4))];
xspan = [a, b];
w0 = [b1; b2;y(1);y(2)];
    [x, w] = ode_rk33(G, xspan, w0, Nh);
    u = w(:, 1); ud = w(:, 2); udd = w(:,3); uddd = w(:,4);
    u = u(end); ud = ud(end); udd = udd(end); uddd = uddd(end);
B0 = approxJ_compl(f_fun, y0, EPS, u, ud, udd,uddd);  


tol = 10^(-12); nmax = 200;
[u1, res, niter] = broyden(@two_point_ShMeth_beam_nonlinearF, B0, y0, tol, nmax, f_fun, a, b, ...
b1, b2, b3, b4, Nh);
G1 = @(x, w) [w(2); w(3); w(4); f_fun(x, w(1), w(2), w(3), w(4))];
w0 = [b1; b2;u1(1);u1(2)];
[x, w] = ode_rk33(G1, xspan, w0, 100);
u = w(:, 1); ud = w(:, 2); udd = w(:,3); uddd = w(:,4);
i = find(x == 1.22);
ii = find(x == 1.67);