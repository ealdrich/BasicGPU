function argMax = maxGamma(x0, alpha, beta, tol)
    
    % Iterate to convergence
    x = x0;
    diff = tol+1;
    count=0;
     while diff > tol
    
         % Compute the first derivative
         %firstDeriv1 = (alpha-1)*(x^(alpha-2))*exp(-beta*x);
         %firstDeriv2 = beta*(x^(alpha-1))*exp(-beta*x);
         %firstDeriv = firstDeriv1 - firstDeriv2;
         firstDeriv = -2*(x-alpha)*exp(-(x-alpha)^2);
         
         % Compute the second derivative
         %secondDeriv1 = (alpha-1)*(alpha-2)*(x^(alpha-3))*exp(-beta*x);
         %secondDeriv2 = 2*beta*(alpha-1)*(x^(alpha-2))*exp(-beta*x);
         %secondDeriv3 = (beta^2)*(x^(alpha-1))*exp(-beta*x);
         %secondDeriv = secondDeriv1 - secondDeriv2 + secondDeriv3;
         secondDeriv = (4*((x-alpha)^2) - 2)*exp(-(x-alpha)^2);
         
         % Newton step
         %xNew = x - firstDeriv/secondDeriv;
         xNew = x - (x-alpha)/(1-2*((x-alpha)^2));
         
         % Compute difference for convergence check and update
         diff = abs(xNew - x);
         x = xNew;
             count=count+1;
         
     end
     
     % Function outpout
     argMax = x;
     
end