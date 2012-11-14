% Grid for order 2 coefficient
nParam = 10000000;
paramMin = 0.1;
paramMax = 0.9;
paramGrid = paramMin:((paramMax-paramMin)/(nParam-1)):paramMax;

% Maximize for each coefficient
argMaxVals = zeros(nParam,1);
for i = 1:nParam
    argMaxVals(i) = maxPoly(2.2, paramGrid(i), 0.00001);
end