function [histogram] = histogramGradients (I)
%I - an image


[gMag, gDir] = imgradient(rgb2gray(I));

[y, x, ~] = size(I);
histogram = zeros([9, 1]);
div = 40;
for i=1 : y
    for j=1 : x
        index = floor((gDir(i, j) + 180) / 40) + 1;
        histogram(index) = histogram(index) + gMag(i, j);
    end
end

histogram = histogram - min(histogram(:));
histogram = histogram ./ max(histogram(:));

end