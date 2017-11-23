function [histogram] = histogramGradients (I)
%I - an image


[gMag, gDir] = imgradient(rgb2gray(I));

[y, x, ~] = size(I);
histogram = zeros([9, 1]);
for i=1 : y
    for j=1 : x
        index = floor((gDir(i, j) + 180) / 40) + 1;
        histogram(index) = histogram(index) + gMag(i, j);
    end
end
histSum = sum(histogram);
if(histSum ~= 0)
    histogram = histogram ./ sum(histogram(:));
end

end