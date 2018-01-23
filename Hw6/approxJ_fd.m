function J = approxJ_fd(fun, x0, x1, varargin)
h = x1 - x0; 
n = length(x0); 
J = zeros(n, n);
F = fun(x1, varargin{:});
for j = 1:n 
    % form the approximate Jacobian
    e = zeros(n,1); e(j) = 1; 
    % form the j-th unit vector
    J(:, j) = (fun(x1 + h(j)*e, varargin{:}) - F)/h(j);
end
