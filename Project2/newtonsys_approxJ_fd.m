function [x,res,niter] = newtonsys_approxJ_fd(Ffun, x0, x1, tol,...
    nmax, varargin)

    niter = 1; err = tol + 1; x = x1;
    while err >= tol && niter < nmax
        J = approxJ_fd(Ffun, x0, x, varargin{:});
        F = Ffun(x, varargin{:});
        delta = - J\F;
        x0 = x;
        x = x + delta;
        err = norm(delta);
        niter = niter + 1;
    end
    res = norm(Ffun(x, varargin{:}));
    if (niter==nmax && err> tol)
        fprintf([' Fails to converge within maximum ',...
            'number of iterations.\n',...
            'The iterate returned has relative ',...
            'residual %e\n'], res);
        err
    else
        fprintf(['The method converged at iteration ',...
            '%i with  residual %e\n'],niter, res);
    end
    return