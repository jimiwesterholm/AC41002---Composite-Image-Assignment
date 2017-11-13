function [ edges ] = edgesInRegion( img, threshold, x1, y1, x2, y2 )
%EDGESINREGION Summary of this function goes here
%   Detailed explanation goes here


edgeImg = edge(img, threshold);
edges = sum(edgeImg(y1:y2, x1:x2)==1);
edges = sum(edges);

end

