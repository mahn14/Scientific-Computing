function A=lugauss(A)
[n,m]=size(A);
if n ~= m
    error("A is not a square matrix"); 
else
    for k = 1:n-1
        for i = k+1:n
            A(i,k) = A(i,k)/A(k,k);
            if A(k,k) == 0
                error('Null diagonal element'); end
            j = [k+1:n]; A(i,j) = A(i,j) - A(i,k)*A(k,j);
        end
    end
end