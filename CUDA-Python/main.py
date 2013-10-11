os.chdir('/home/ealdrich/Projects/BasicGPU/CUDA-Python')
from numbapro import cuda
import numpy as np
import maxPoly
maxPoly = maxPoly.maxPoly

# Grid for order 2 coefficient
nParam = 1000
paramMin = -.9
paramMax = -.1
paramGrid = np.linspace(paramMin, paramMax, nParam)

# Storage for argmax values
argMaxVals = np.zeros(nParam)

# Maximize for each coefficient
threadsPerBlock = 256
blocksPerGrid = int(ceil(float64(nParam)/threadsPerBlock))
maxPoly[blocksPerGrid, threadsPerBlock](2.2, paramGrid, 0.00001, nParam, argMaxVals)

print argMaxVals
