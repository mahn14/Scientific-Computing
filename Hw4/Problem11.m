%% Homework 4: Problem 11

 
A = hilb(5);
x = [1 1 1 1 1]';
b = A*x;

%a.) 
P = eye(5, 5);
x5 = pcg_TL(A, b, P, 5);

%b.)
SSE = sum((x5 - x).^2); %sum of squared errors
MEE = max(abs(x5-x));   %max element-wise error

%c.)
x_best = pcg_TL(A, b, P, 717);


