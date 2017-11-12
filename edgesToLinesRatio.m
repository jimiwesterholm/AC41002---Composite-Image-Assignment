function [ ratio ] = edgesToLinesRatio( image, method )
%EDGESTOLINESRATIO Summary of this function goes here
%   Detailed explanation goes here
imgPixels = size(image(:));
edges = edge(image, 'canny');
[ihough, theta, rho]= hough(edges);
if measure < 4
    peaks = houghpeaks(ihough, 1073741824);
else
    peaks = houghpeaks(ihough, 3);
end
lines = houghlines(ihough, theta, rho, peaks);
totalEdges = sum(sum(edges));
dist = 0;
for i=1 : length(lines)
    switch method
        case 1
            dist = dist + sqrt((lines(i).point1(1) - lines(i).point2(1))^2 + (lines(i).point1(2) - lines(i).point2(2))^2);
            ratio =  totalEdges / dist;
        case 2
            dist = dist + sqrt((lines(i).point1(1) - lines(i).point2(1))^2 + (lines(i).point1(2) - lines(i).point2(2))^2);
            ratio =  imgPixels / dist;
        case 3
            dist = dist + sum(improfile(edges, lines(i).point1, lines(i).point2));
            ratio =  totalEdges / dist;
        case 4
            dist = dist + sqrt((lines(i).point1(1) - lines(i).point2(1))^2 + (lines(i).point1(2) - lines(i).point2(2))^2);
            ratio =  totalEdges / dist;
            
            
    end
end


end