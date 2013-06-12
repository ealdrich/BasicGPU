import numpy as np
import maxPoly
maxPoly = maxPoly.maxPoly

# Grid for order 2 coefficient
nParam = 1024
paramMin = -.9
paramMax = -.1
paramGrid = np.linspace(paramMin, paramMax, nParam)

# Maximize for each coefficient
argMaxVals = np.zeros(nParam)
for i in np.arange(1,nParam):
    argMaxVals[i] = maxPoly(2.2, paramGrid[i], .00001)

print argMaxVals
