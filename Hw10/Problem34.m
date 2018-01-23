%% Problem 34

%a.) nodes and weights for GL
n = 4;
B1 = sqrt(2);
B2 = pi;

int1 = quadrature_GL(@GL34b, 0, 0.5, n, B1);
int2 = quadrature_GL(@GL34b, 0, 0.5, n, B2);
