function [ ratio ] = edgesToLinesRatio( image, method )
%EDGESTOLINESRATIO Summary of this function goes here
%   Detailed explanation goes here

edges = edge(image, 'canny');
[ihough, theta, rho]= hough(edges);

%peaks = houghpeaks(ihough, 1073741824);
peaks = houghpeaks(ihough, 10000, 'Threshold', 0.2*max(ihough(:)));

lines = houghlines(edges, theta, rho, peaks, 'MinLength', 5, 'FillGap',5);

totalEdges = sum(sum(edges));
imgPixels = size(image(:));

dist = zeros(length(lines));
for i=1 : length(lines)
    switch method
        case 1
            dist = dist + sqrt((lines(i).point1(1) - lines(i).point2(1))^2 + (lines(i).point1(2) - lines(i).point2(2))^2);
        case 2
            dist = dist + sqrt((lines(i).point1(1) - lines(i).point2(1))^2 + (lines(i).point1(2) - lines(i).point2(2))^2);
        case 3
            dist = dist + sum(improfile(edges, lines(i).point1, lines(i).point2));
        case 4
            dist(i) = sqrt((lines(i).point1(1) - lines(i).point2(1))^2 + (lines(i).point1(2) - lines(i).point2(2))^2);
            
    end
end
dist = sort(dist, 'descend');
%ratio =  max(dist(:));
%ratio =  dist(1) + dist(2) + dist(3);
ratio = sum(totalEdges) / sum(sum(dist));

end