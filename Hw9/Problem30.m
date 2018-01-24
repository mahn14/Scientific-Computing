%% Problem 30


%a.) Implement hermite_interp

%b.) f(x) = sin(exp(x));

x = [0 1/2 1];
y = sin(exp(x));
ty = cos(exp(x)).*exp(x);

p = @(z) hermite_interp(z, x, y, ty, 0);
pd = @(z) hermite_interp(z, x, y, ty, 1);

[p(1/4) pd(1/4) p(3/4) pd(3/4)]'

%c.) Cubic piecewise

x1 = [0 1/2];
y = sin(exp(x1));
ty = cos(exp(x1)).*exp(x1);
pc1 = @(z) hermite_interp(z, x1, y, ty, 0);
pcd1 = @(z) hermite_interp(z, x1, y, ty, 1);
[pc1(1/4) pcd1(1/4)]'

x2 = [1/2 1];
y = sin(exp(x2));
ty = cos(exp(x2)).*exp(x2);
pc2 = @(z) hermite_interp(z, x2, y, ty, 0);
pcd2 = @(z) hermite_interp(z, x2, y, ty, 1);
[pc2(3/4) pcd2(3/4)]'


