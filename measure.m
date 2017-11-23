function [colourDist, gradientDist] = measure(goal, sourceGrad, sourceCol, gradBinDiv, colourBin)
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
gGHist = gradientHistogramsBySections(goal, gradBinDiv);
% gHist = colourHist_new(goal, 16);
% gHist = colourHist_new(goal, 2);
colourDist = zeros(length(sourceCol), 1);
gradientDist = zeros(length(sourceCol), 1);
for i = 1 : length(sourceCol)
    colourDist(i, 1) = pdist2(gCHist', sourceCol{i}');
    for a = 1 : gradBinDiv*2 - 1
        for b = 1 : gradBinDiv*2 - 1
            gradientDist(i, 1) = gradientDist(i, 1) + pdist2(gGHist{a, b}', sourceGrad{i}{a, b}');
        end
    end
end

%Normalise distances
gradientDist = gradientDist ./ sum(gradientDist(:));
colourDist = colourDist ./ sum(colourDist(:));
end

