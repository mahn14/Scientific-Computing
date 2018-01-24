%% Problem 28

y = [3.52, 3.62, 3.65, 3.52, 3.47, 3.25, 3.15, 3.15, 3.2, 3.27, 3.52, 3.7, 3.7];
y = fliplr(y);
x = [-55 -45 -35 -25 -15 -5 5 15 25 35 45 55 65];

%.a) Cublic Spline with Newton
conds = [1 1];
d1 = 0.003979604851107; d2 =-0.010471912543415;
y_with_bc = [d1 y d2];
Sc_info = csape(x, y_with_bc, conds);
Sc = @(x) ppval(Sc_info, x) - 3.175;%% Evalue the cubic spline function at x = 4.5Sn(4.5)
%figure(1); clf;
xx = x(1):0.01:x(end); 
yy = Sc(xx);

% form the 1st derivative function
coefs = (Sc_info.coefs);
coefs = [3*coefs(:, 1), 2*coefs(:, 2), coefs(:, 3)];
Sc_d1_info = mkpp(x, coefs);
Sc_d1 = @(t) ppval(Sc_d1_info, t);%% form the 2nd derivative function
coefs = (Sc_info.coefs);
coefs = [6*coefs(:, 1), 2*coefs(:, 2)];
Sc_d2_info = mkpp(x, coefs);
Sc_d2 = @(t) ppval(Sc_d2_info, t);


%using Newton
x0 = 5;
tol = 10^(-12);
nmax = 2;
[x_a, res_a, niter_a] = newton(Sc, Sc_d1, x0, tol, nmax);


% Newton
x = -55:0.01:65;
y1 = Sc(x) + 3.175;
y2 = 3.175;
%plot(x, y1, x, y2);
nmax = 100;
[x_b1, res_b1, niter_b1] = newton(Sc, Sc_d1, -8, tol, nmax);
[x_b2, res_b2, niter_b2] = newton(Sc, Sc_d1, 8, tol, nmax);