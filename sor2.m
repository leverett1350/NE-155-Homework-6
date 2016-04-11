function [x,i] = sor2(A,b,x0)
%SOR function that also is for gassian siedel (when omega = 1)
% Input  - A is an N x N nonsingular matrix
%        - B is an N x 1 matrix
%        - P is an N x 1 matrix; the initial guess
%	     - tol is the tolerance for P
%	     - maxi is the maximum number of iterations
%        - omega is set convergence factor with value 0 < omega < 2
% Output - X is an N x 1 matrix: the jacobi approximation to
%	        the solution of AX = B
%         - i is the number of iterations
D = diag(diag(A));
%returns diagonal values matrix
U = triu(A-D);
%returns upper triangular matrix
L = tril(A-D);
%returns lower triangular matrix
count = 0;
xtable = x0;
w = 1;
xnew = (inv(D+w*L))*(((1-w)*D-w*U)*x0 +w*b);
RelErrorCol=1;
    while RelErrorCol>1e-4
        xnew = (inv(D+w*L))*(((1-w)*D-w*U)*x0 +w*b);
        RelError = (abs(xnew-x0))/(abs(xnew));
        RelErrorCol = max(max(RelError));
        %Error = abs(norm(xnew-x0));
        x0 = xnew;
        count = count+1;
        xtable = [xtable, xnew];
    end
    %Error = abs(norm(xtable(count)-xtable(count-1)));
%   disp(xtable);
    x = xnew;
    i = count;
end