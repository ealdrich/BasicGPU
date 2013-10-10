% Grid for order 2 coefficient
nParam = 1000;
paramMin = -0.9;
paramMax = -0.1;
paramGrid = paramMin:((paramMax-paramMin)/(nParam-1)):paramMax;

% Storage for output
argMaxVals = zeros(nParam,1);

% Load the kernel PTX code (compile with: nvcc -ptx maxPoly.cu)
maxPolyKernel = parallel.gpu.CUDAKernel('maxPoly.ptx', 'maxPoly.cu');

% Define block size
maxPolyKernel.ThreadBlockSize = [nParam 1 1];

% Evaluate with the kernel
argMaxVals = feval(maxPolyKernel, 2.2, paramGrid, 0.00001, nParam, argMaxVals);
