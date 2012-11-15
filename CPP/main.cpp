#include <Eigen/Dense>

using namespace Eigen;

double maxPoly(double x0, double coef, double tol);

int main()
{

  // Grid for order 2 coefficient
  int nParam = 100000000;
  double paramMin = -0.9;
  double paramMax = -0.1;
  VectorXd paramGrid = VectorXd::LinSpaced(nParam, paramMin, paramMax);

  // Maximize for each coefficient
  VectorXd argMaxVals = VectorXd::Zero(nParam);
  for(int i = 0 ; i < nParam ; ++i){
    argMaxVals(i) = maxPoly(2.2, paramGrid(i), 0.00001);
  }
  
  return 0;

}
