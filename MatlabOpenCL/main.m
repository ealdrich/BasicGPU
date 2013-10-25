clear all;
close all;

% OpenCL Admin
ocl = opencl();
ocl.initialize(1,1);
ocl.addfile('maxPoly.cl');
ocl.build();

% Grid for order 2 coefficient
nParam = 1000;
paramMin = -0.9;
paramMax = -0.1;
paramGrid = paramMin:((paramMax-paramMin)/(nParam-1)):paramMax;

% Copy parameter grid from CPU to GPU memory
paramGridDevice = clbuffer('ro', 'double', int32(nParam));
paramGridDevice.set(paramGrid);

% Storage for argmax values
argMaxValsDevice = clbuffer('wo', 'double', int32(nParam));

% Maximize for each coefficient
maxPolyKernel = clkernel('maxPoly', [int32(nParam),0,0], [int32(nParam),0,0]);
maxPolyKernel(2.2, paramGridDevice, 0.00001, int32(nParam), argMaxValsDevice);
ocl.wait();

% Copy argmax values from GPU to CPU memory
argMaxVals = argMaxValsDevice.get();
argMaxVals'
