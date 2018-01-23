function [zero,res,niter]=newton(fun,dfun,x0,...
    tol, m, nmax,varargin)

x = x0;
niter = 0; diff = tol+1;
while diff >= tol && niter < nmax
niter = niter + 1;
fux = fun(x,varargin{:}); dfx = dfun(x,varargin{:});
diff = - m*f(x)/fdx(x);
x = x + diff;
diff = abs(diff);
niter = niter + 1;
end
if (niter==nmax && diff > tol)
fprintf(['Newton stopped without converging to',...
' the desired tolerance because the maximum\n ',...
'number of iterations was reached\n']);
end
zero = x; res = fun(x,varargin{:});
return;