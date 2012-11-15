#include "maxPoly.cu"

int main()
{

  // Grid for order 2 coefficient
  int nParam = 1000000000;
  double paramMin = 0.1;
  double paramMax = 0.9;
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
  maxPoly<<<1,256>>>(2.2, paramGridDevice, 0.00001, argMaxValsDevice);

  // Copy argmax values from GPU to CPU memory
  double* argMaxVals = new double[nParam];
  cudaMemcpy(argMaxVals, argMaxValsDevice, nParam*sizeof(double), cudaMemcpyDeviceToHost);

  return 0;

}
