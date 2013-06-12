#include <iostream>
#include <thrust/device_vector.h>
#include <thrust/sequence.h>
#include <thrust/transform.h>
#include "maxPoly.hpp"

using namespace std;

int main()
{

  // Grid for order 2 coefficient
  int nParam = 1024;
  double paramMin = -0.9;
  double paramMax = -0.1;
  thrust::device_vector<double> paramGrid(nParam);
  thrust::sequence(paramGrid.begin(), paramGrid.end(), paramMin, (paramMax-paramMin)/(nParam-1));

  // Maximize for each coefficient
  thrust::device_vector<double> argMaxVals(nParam);
  thrust::transform(paramGrid.begin(), paramGrid.end(), argMaxVals.begin(), maxPoly(2.2, 0.00001));

  for(int i = 0 ; i < nParam ; ++i){
    cout << argMaxVals[i] << endl;
  }
  
  return 0;

}
