function [img, lowestValue] = measureSimilarity(goal, sources)
%MEASURESIMILARITY Get histograms of source images, return the best match
%   goal - section of the original image
%   sources - source images to be matched


%Add normalisation? Might not be needed since each image is already the
%same size - same number of pixels

lowestValue = Inf;
gHist = imhist(goal);

for i = 1 : length(sources)
    distance = pdist2(imhist(sources{i})', gHist');
    if distance < lowestValue
        lowestValue = distance;
        img = i;
    end
end


end

