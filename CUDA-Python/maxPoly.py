from numbapro import cuda

@cuda.jit('void(float32, float32[:], float32, int32, float32[:])', target='gpu')
def maxPoly(x0, coef, tol, nParam, argMax):

    # Thread IDs
    i = cuda.grid(1)
    
    # The Kernel should only execute if i < nParam
    if i >= nParam:
        return
    else:
        
        # Iterate to convergence
        x = x0
        diff = tol+1
        while diff > tol:
        
            # Compute the first derivative
            firstDeriv = 2*coef[i]*x + 2.3

            # Compute the second derivative
            secondDeriv = 2*coef[i]

            # Newton step
            xNew = x - firstDeriv/secondDeriv

            # Compute difference for convergence check and update
            diff = abs(xNew-x)
            x = xNew

        # Function output
        argMax[i] = x
