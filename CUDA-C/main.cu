#include <iostream>
#include "maxPoly.cu"

using namespace std;

int main()
{

  // Grid for order 2 coefficient
  int nParam = 1024;
  double paramMin = -0.9;
  double paramMax = -0.1;
  double* paramGrid = new double[nParam];
  for(int i = 0 ; i < nParam ; ++i) paramGrid[i] = paramMin + i*(paramMax-paramMin)/(nParam-1);

  // Copy parameter grid from CPU to GPU memory
  double* paramGridDevice;
  cudaMalloc((void**)&paramGridDevice, nParam*sizeof(double));
  cudaMemcpy(paramGridDevice, paramGrid, nParam*sizeof(double), cudaMemcpyHostToDevice);

  // Storage for argmax values
  double* argMaxValsDevice;
  cudaMalloc((void**)&argMaxValsDevice, nParam*sizeof(double));

  // Maximize for each coefficient
  int threadsPerBlock = 256;
  int blocksPerGrid = (int)ceil((double)nParam/threadsPerBlock);
  maxPoly<<<blocksPerGrid, threadsPerBlock>>>(2.2, paramGridDevice,
					      0.00001, nParam, argMaxValsDevice);

  // Copy argmax values from GPU to CPU memory
  double* argMaxVals = new double[nParam];
  cudaMemcpy(argMaxVals, argMaxValsDevice, nParam*sizeof(double), cudaMemcpyDeviceToHost);

  for(int i = 0 ; i < nParam ; ++i){
    cout << argMaxVals[i] << endl;
  }

  return 0;

}
