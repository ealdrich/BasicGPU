#include <Eigen/Dense>

using namespace Eigen;

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
    diff = abs(xNew - x);
    x = xNew;
                  
  }
     
  // Function outpout
  return x;

}

int main()
{

  // Grid for order 2 coefficient
  int nParam = 1000000;
  double paramMin = 0.1;
  double paramMax = 0.9;
  VectorXd paramGrid = VectorXd::LinSpaced(nParam, paramMin, paramMax);

  // Maximize for each coefficient
  VectorXd argMaxVals = VectorXd::Zero(nParam);
  for(int i = 0 ; i < nParam ; ++i){
    argMaxVals(i) = maxPoly(2.2, paramGrid(i), 0.00001);
  }
  
  return 0;

}
