function img = measureSimilarity(goal, sources)
%measureSimilarity Get histograms of source images, return the best match
%   goal - section of the original image
%   sources - source images to be matched
%{
TODO: preserve colour relationships in histogram

[x, y, dim] = size(goal);
vectorX = 1:x;
vectorY = 1:y;

for i=1 : size(vectorX)
    for j=1 : size(vectorY)
        impixel
    end
end

For now though:
%}

gHist = imhist(goal);
lowestMatch = Inf;
disp(length(sources));
for i = 1 : length(sources)
    distance = pdist2(imhist(sources{i})', gHist');
    if distance < lowestMatch
        lowestMatch = distance;
        img = i;
    end
end


end

