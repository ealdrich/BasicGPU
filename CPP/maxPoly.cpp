#include <math.h>

double maxPoly(double x0, double coef, double tol){

  // Iterate to convergence
  double x = x0;
  double diff = tol+1;
  double firstDeriv, secondDeriv, xNew;
  while(diff > tol){
    
    // Compute the first derivative
    firstDeriv = 2.3 - 2*coef*x;
         
    // Compute the second derivative
    secondDeriv = -2*coef;
         
    // Newton step
    xNew = x - firstDeriv/secondDeriv;
         
    // Compute difference for convergence check and update
    diff = fabs(xNew - x);
    x = xNew;
                  
  }
     
  // Function outpout
  return x;

}
