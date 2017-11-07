function [img, lowestValue] = measure(goal, sources)
%MEASURE Get histograms of source images, return the best match
%   goal - section of the original image
%   sources - source images to be matched


%Add normalisation? Might not be needed since each image is already the
%same size - same number of pixels

lowestValue = Inf;
gHist = colourHist(goal, 2);

for i = 1 : length(sources)
    distance = pdist2(colourHist(sources{i}, 2)', gHist');
    if distance < lowestValue
        lowestValue = distance;
        img = i;
    end
end


end

