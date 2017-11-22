function [colorDist, gradientDist] = measureSim(goal, sourceGrad, sourceCol, gradBinDiv, colourBin)
%MEASURE Get histograms of source images, return the distances to the goal
%section
%   goal - section of the original image
%   sources - source images to be matched
%   colourBin - determines the amount of bins per colour - total bins
%   therefore the value cubed
%   gradBinDiv - how many sections to split the image into - gradients are taken
%   from these + in between each one


%Add normalisation? Might not be needed since each image is already the
%same size - same number of pixels

gCHist = colourHist(goal, colourBin);
gGHist = histogramGradients(goal);
% gHist = colourHist_new(goal, 16);
% gHist = colourHist_new(goal, 2);
colorDist = zeros(length(sourceCol), 1);
gradientDist = zeros(length(sourceCol), 1);
for i = 1 : length(sourceCol)
    colorDist(i, 1) = pdist2(gCHist', sourceCol{i}');
    gradientDist(i, 1) = pdist2(gGHist', sourceGrad{i}');
end

%Normalise distances
gradientDist = gradientDist ./ sum(gradientDist(:));
colorDist = colorDist ./ sum(colorDist(:));
end

