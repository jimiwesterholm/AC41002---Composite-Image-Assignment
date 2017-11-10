function [ ratio ] = edgesToLinesRatio( image )
%EDGESTOLINESRATIO Summary of this function goes here
%   Detailed explanation goes here
imgPixels = size(image(:));
edges = edge(image, 'canny');
[ihough, theta, rho]= hough(edges);
peaks = houghpeaks(ihough, 1073741824);
lines = houghlines(ihough, theta, rho, peaks);
totalEdges = sum(sum(edges));
dist = 0;
for i=1 : length(lines)
    dist = dist + sqrt((lines(i).point1(1) - lines(i).point2(1))^2 + (lines(i).point1(2) - lines(i).point2(2))^2);
    %dist = dist + improfile(edges, lines(i).point1, lines(i).point2);
end

ratio =  totalEdges / dist;
end

