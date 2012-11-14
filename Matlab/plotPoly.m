% Support of polynomial for plotting
xMin = -10;
xMax = 20;
nX = 1000;
xGrid = xMin:((xMax-xMin)/(nX-1)):xMax;

% Grid of second order polynomial coefficients
paramMin = 0.1;
paramMax = 0.9;
nParam = 100;
paramGrid = paramMin:((paramMax-paramMin)/(nParam-1)):paramMax;

% Plot the function for each second order coefficient
for i = 2:nParam
    fGamma = 5.4 + 2.3*xGrid - paramGrid(i)*xGrid.^2;
    if i==1
        plot(xGrid,fGamma)
    else
        linePlot = line(xGrid,fGamma)
        set(linePlot, 'Color', [paramGrid(i),paramGrid(i),paramGrid(i)])
    end
end
ylim([0 20]);