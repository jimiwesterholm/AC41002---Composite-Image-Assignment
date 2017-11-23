function [ result ] = longestLine( image )
%LONGESTLINE Find the length of the longest straight line
%   image - the grayscale image to find the line from

edges = edge(image, 'canny');
[ihough, theta, rho]= hough(edges);

%peaks = houghpeaks(ihough, 1073741824);
peaks = houghpeaks(ihough, 10, 'Threshold', 0.5*max(ihough(:)));

lines = houghlines(edges, theta, rho, peaks, 'MinLength', 5, 'FillGap',5);

%totalEdges = sum(sum(edges));
imgPixels = size(image);

dist = zeros(length(lines), 1);
for i=1 : length(lines)
    dist(i) = sqrt((lines(i).point1(1) - lines(i).point2(1))^2 + (lines(i).point1(2) - lines(i).point2(2))^2);
end
dist = sort(dist, 'descend');
result = dist(1) / mean(imgPixels);

%ratio =  dist(1) + dist(2) + dist(3);
%ratio = imgPixels(1) / max(dist(:));

end