function [ ratio ] = edgesToLinesRatio( image )
%EDGESTOLINESRATIO Summary of this function goes here
%   Detailed explanation goes here

edges = edge(image, 'canny');
[ihough, theta, rho]= hough(edges);

%peaks = houghpeaks(ihough, 1073741824);
peaks = houghpeaks(ihough, 10000, 'Threshold', 0.5*max(ihough(:)));

lines = houghlines(edges, theta, rho, peaks, 'MinLength', 5, 'FillGap',5);

%totalEdges = sum(sum(edges));
imgPixels = size(image(:));

dist = zeros(length(lines), 1);
for i=1 : length(lines)
    dist(i) = sqrt((lines(i).point1(1) - lines(i).point2(1))^2 + (lines(i).point1(2) - lines(i).point2(2))^2);
end
dist = sort(dist, 'descend');
ratio = dist(1);
if length(dist) > 2
    ratio =  ratio+dist(2);
elseif length(dist) > 3
    ratio = ratio+dist(3);
end
%ratio =  dist(1) + dist(2) + dist(3);
%ratio = imgPixels(1) / max(dist(:));

end