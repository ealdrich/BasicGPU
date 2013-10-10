#include <math.h>

__global__ void maxPoly(const double x0, const double* coef,
			const double tol, const int nParam, double* argMax){

  // Thread ID
  int i = blockIdx.x*blockDim.x + threadIdx.x;

  // The Kernel should only execute if i < nParam
  if(i >= nParam){
    return;
  } else {

    // Iterate to convergence
    double x = x0;
    double diff = tol+1;
    double firstDeriv, secondDeriv, xNew;
    while(diff > tol){
      
      // Compute the first derivative
      firstDeriv = 2*coef[i]*x + 2.3;
      
      // Compute the second derivative
      secondDeriv = 2*coef[i];
      
      // Newton step
      xNew = x - firstDeriv/secondDeriv;
      
      // Compute difference for convergence check and update
      diff = fabs(xNew - x);
      x = xNew;
      
    }

    // Function outpout
    argMax[i] = x;
  }

}
