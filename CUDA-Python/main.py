os.chdir('/home/ealdrich/Projects/BasicGPU/PyCUDA')
from numbapro import cuda
import numpy as np
import maxPoly
maxPoly = maxPoly.maxPoly

# Grid for order 2 coefficient
nParam = 1000
paramMin = -.9
paramMax = -.1
paramGrid = np.linspace(paramMin, paramMax, nParam).astype(np.float32)

# Storage for argmax values
argMaxVals = np.zeros(nParam).astype(np.float32)

# Maximize for each coefficient
threadsPerBlock = 256
blocksPerGrid = int(ceil(nParam/threadsPerBlock))
maxPoly[blocksPerGrid, threadsPerBlock](np.float32(2.2), paramGrid, np.float32(0.00001), nParam, argMaxVals)

print argMaxVals
