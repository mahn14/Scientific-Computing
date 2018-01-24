function [zero,res,niter]=secant(fun, x0, x1, ...
tol, nmax, varargin)


x = x0;
niter = 0; diff = tol+1;
while diff >= tol & niter < nmax

    % One secant iteration
niter = niter + 1;
diff = -((x1 - x0)/(fun(x1) - fun(x0)))*fun(x1);
x = x1 + diff;
diff = abs(diff);
x0 = x1; x1 = x;
    
end

if (niter==nmax & diff > tol)
fprintf(['Newton stopped without converging to',...
' the desired tolerance because the maximum\n ',...
'number of iterations was reached\n']);
end
zero = x; res = fun(x,varargin{:});
return;