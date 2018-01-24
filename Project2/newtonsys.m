function [x,res,niter] = newtonsys(Ffun, Jfun, x0, tol,...
nmax, varargin)
niter = 0; err = tol + 1; x = x0;
while err >= tol && niter < nmax
J = Jfun(x,varargin{:}); F = Ffun(x,varargin{:});
delta = - J\F; x = x + delta;
err = norm(delta); niter = niter + 1;
end
res = norm(Ffun(x,varargin{:}));
if (niter==nmax && err> tol)
fprintf([' Fails to converge within maximum ',...
'number of iterations.\n',...
'The iterate returned has relative ',...
'residual %e\n'],res);
else
fprintf(['The method converged at iteration ',...
'%i with residual %e\n'],niter,res);
end
return