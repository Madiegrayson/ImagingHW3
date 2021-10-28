A = [8, 2;2,900];
a = 1;
b2 = -(A(1,1)+A(2,2));
c = (A(1,1)*A(2,2)) - (A(1,2)*A(2,1));
lambda1 = (-b2+sqrt(b2^2-(4*a*c)))/(2*a);
lambda2 = (-b2-sqrt(b2^2-(4*a*c)))/(2*a);
myEigenValues = [lambda1, lambda2];

A = [8, 2;2,900];
b = [6;1];
x = [0;0];

convergence = 1.0;
tolerance   = 1.e-12;
iterations  = 0;

xTAx = x'*A*x;
bTx = b'*x;
fx = (0.5*xTAx) - bTx;
gradfx = (A*x) - b;
  
% update the variable x with your solution
while (convergence > tolerance)
  % evaluate exact line search 
  x_it = x - (((gradfx'*gradfx)/(gradfx'*A*gradfx))*gradfx);
  % update the solution
  x = x_it;
  
  xTAx = x'*A*x;
  bTx = b'*x;
  fx = (0.5*xTAx) - bTx;
  gradfx = (A*x) - b;
  convergence = abs(gradfx);
  % update the iteration count
  iterations  = iterations  + 1;
end
disp(sprintf('# iter = %d, x = (%f,%f)',iterations,x ));
