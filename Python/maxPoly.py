def maxPoly(x0, coef, tol):

    # Iterate to convergence
    x = x0
    diff = tol+1
    while diff > tol:

        # Compute the first derivative
        firstDeriv = 2*coef*x + 2.3

        # Compute the second derivative
        secondDeriv = 2*coef

        # Newton step
        xNew = x - firstDeriv/secondDeriv

        # Compute difference for convergence check and update
        diff = abs(xNew-x)
        x = xNew

    # Function output
    return x
