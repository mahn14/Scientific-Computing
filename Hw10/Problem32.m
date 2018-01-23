%% Problem 32: Exercise 4.4
%compute n'(1.5) by finite difference formulas specified in table

t = [0 0.5 1 1.5 2 2.5 3]';
n = [100 147 178 192 197 199 200]';
x = 4;

nprime = 2*192 - 0.01*192^2;
Df = (n(x+1) - n(x)) / 0.5;
Db = (n(x) - n(x-1)) / 0.5;
Dc = (n(x+1) - n(x-1)) / 1;

D43a = (-11*n(x) + 18*n(x+1) - 9*n(x+2) + 2*n(x+3)) / 6*0.5;
D43b = (n(x-2) - 6*n(x-1) + 3*n(x) + 2*n(x+1)) / 6*0.5;