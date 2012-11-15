#include <math.h>

struct maxPoly{

  // Arguments
  const double x0; ///< Initial value
  const double tol; ///< Convergence criterion

  /// Constructor
  maxPoly(const double _x0, const double _tol) : x0(_x0), tol(_tol) {}

  /// Kernel
  __host__ __device__
  double operator()(const double coef) const {

    // Iterate to convergence
    double x = x0;
    double diff = tol+1;
    double firstDeriv, secondDeriv, xNew;
    while(diff > tol){
      
      // Compute the first derivative
      firstDeriv = 2*coef*x + 2.3;
      
      // Compute the second derivative
      secondDeriv = 2*coef;
      
      // Newton step
      xNew = x - firstDeriv/secondDeriv;
      
      // Compute difference for convergence check and update
      diff = fabs(xNew - x);
      x = xNew;
      
    }
     
    // Function output
    return x;
    
  }

};
