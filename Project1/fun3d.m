function f = fun3d(x, a1, a2, a3, a4)

f = (2 *(a2 - exp(a3*x))*x + 3*a4*x^2 - a3*exp(a3*x)*x^2) ... 
    *cos(a1 + (a2 - exp(a3*x))*x^2 + a4*x^3);

end