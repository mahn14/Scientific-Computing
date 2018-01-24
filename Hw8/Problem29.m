%% Problem 29

%a.) Estimating
X_large = [0.00 0.06 0.14 0.25 0.31 0.47 0.60 0.70];
Y_large = [0.00 0.08 0.14 0.20 0.23 0.25 0.28 0.29];
conds = [2, 2]; 
d1 = 0; d2 = 0; % specify 2nd order BC
y_with_bc = [d1 Y_large d2];
S_info = csape(X_large, y_with_bc, conds);
S = @(z) ppval(S_info, z); 
ans_a = [S(0.15) S(0.35) S(0.65) S(0.8)]';

%b.) Plotting

figure(1); clf;
xx = X_large(1):0.01:X_large(end); 
yy = S(xx);
plot(xx, yy, X_large, Y_large, 'r*');
grid on;
axis([0, 0.7, 0, 0.31])