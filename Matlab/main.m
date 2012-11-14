% Grid for shape parameter (alpha)
nA = 10;
aMin = 3;
aMax = 10;
aGrid = aMin:((aMax-aMin)/(nA-1)):aMax;

% Grid for scale parameter (beta)
nB = 10;
bMin = 3;
bMax = 100;
bGrid = bMin:((bMax-bMin)/(nB-1)):bMax;

argMaxVals = zeros(nA,nB);
for i = 1:nA
    for j = 1:nB
        argMaxVals(i,j) = maxGamma(aGrid(i)/2, aGrid(i), bGrid(j), 0.00001);
    end
end
