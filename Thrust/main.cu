#include <thrust/device_vector.h>
#include <thrust/sequence.h>
#include <thrust/transform.h>
#include "maxPoly.hpp"
#include "Eigen/Dense"

using namespace Eigen

int main()
{

  MatrixXd Test(5,5);

  // Grid for order 2 coefficient
  int nParam = 1000000000;
  double paramMin = -0.9;
  double paramMax = -0.1;
  thrust::device_vector<double> paramGrid(nParam);
  thrust::sequence(paramGrid.begin(), paramGrid.end(), paramMin, (paramMax-paramMin)/(nParam-1));

  // Maximize for each coefficient
  thrust::device_vector<double> argMaxVals(nParam);
  thrust::transform(paramGrid.begin(), paramGrid.end(), argMaxVals.begin(), maxPoly(2.2, 0.00001));
  
  return 0;

}
