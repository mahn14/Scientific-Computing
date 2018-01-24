% Problem 1

%% a.) Cubic Splines for natural and clamped

% CLAMPED
    % Curve 1
x1 = [1 2 5 6 7 8 10 13 17];
y1 = [3.0 3.7 3.9 4.2 5.7 6.6 7.1 6.7 4.5];
yconds1c = [1,1]; y_bc1 = [1.0 y1 -0.67];
S1c_info = csape(x1, y_bc1, yconds1c);
Sy1c = @(x1) ppval(S1c_info, x1);
ans1c = Sy1c(10.5);
    % Curve 2
x2 = [17 20 23 24 25 27 27.7];
y2 = [4.5 7.0 6.1 5.6 5.8 5.2 4.1];
yconds2c = [1,1]; y_bc2 = [3.0 y2 -4.0];
S2c_info = csape(x2, y_bc2, yconds2c);
Sy2c = @(x2) ppval(S2c_info, x2);
ans2c = Sy2c(20.5);
    % Curve 3
x3 = [27.7 28 29 30];
y3 = [4.1 4.3 4.1 3.0];
yconds3c = [1,1]; y_bc3 = [0.33 y3 -1.5];
S3c_info = csape(x3, y_bc3, yconds3c);
Sy3c = @(x3) ppval(S3c_info, x3);
ans3c = Sy3c(28.5);

% Natural
    % Curve 1
conds = [2, 2];
S1n_info = csape(x1, y_bc1, conds);
Sy1n = @(x1) ppval(S1n_info, x1);
ans1n = Sy1n(10.5);
    % Curve 2
conds = [2, 2];
S2n_info = csape(x2, y_bc2, conds);
Sy2n = @(x2) ppval(S2n_info, x2);
ans2n = Sy2n(20.5);
    % Curve 1
conds = [2, 2];
S3n_info = csape(x3, y_bc3, conds);
Sy3n = @(x3) ppval(S3n_info, x3);
ans3n = Sy3n(28.5);

%% b.) Make a Plot by Clamped Splines

xx1 = x1(1):0.01:x1(end);
yy1 = Sy1c(xx1);
xx2 = x2(1):0.01:x2(end);
yy2 = Sy2c(xx2);
xx3 = x3(1):0.01:x3(end);
yy3 = Sy3c(xx3);
plot(xx1, yy1, x1, y1, 'g*', xx2, yy2, x2, y2, 'r*', ...
    xx3, yy3, x3, y3, 'b*');
axis([0, 30, 0, 30])

%% c.) Find arclength L for 2nd curve of top profile

coefs_matrix = S2c_info.coefs;

coefs = coefs_matrix*[3 0 0 0; 0 2 0 0; 0 0 1 0; 0 0 0 0];
coefs = [coefs(:,1) coefs(:,2) coefs(:,3)];

p1 = coefs(1,:);
p2 = coefs(2,:);
p3 = coefs(3,:);
p4 = coefs(4,:);
p5 = coefs(5,:);
p6 = coefs(6,:);

f1 = @(t) sqrt(1 + polyval(p1,t).^2);
s1 = quadrature_comp(f1, x2(1), x2(2), 200, @quadrature_GL, 3);
f2 = @(t) sqrt(1 + polyval(p2,t).^2);
s2 = quadrature_comp(f2, x2(2), x2(3), 200, @quadrature_GL, 3);
f3 = @(t) sqrt(1 + polyval(p3,t).^2);
s3 = quadrature_comp(f3, x2(3), x2(4), 200, @quadrature_GL, 3);
f4 = @(t) sqrt(1 + polyval(p4,t).^2);
s4 = quadrature_comp(f4, x2(4), x2(5), 200, @quadrature_GL, 3);
f5 = @(t) sqrt(1 + polyval(p5,t).^2);
s5 = quadrature_comp(f5, x2(5), x2(6), 200, @quadrature_GL, 3);
f6 = @(t) sqrt(1 + polyval(p6,t).^2);
s6 = quadrature_comp(f6, x2(6), x2(7), 200, @quadrature_GL, 3);

L = s1+s2+s3+s4+s5+s6;
