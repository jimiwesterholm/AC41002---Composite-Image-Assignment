function [secHists] = gradientHistogramsBySections(I, binDiv)
%GRADIENTHISTOGRAMSBYSECTIONS Summary of this function goes here
%   Detailed explanation goes here

[m, n, ~] = size(I);

sx = floor(n / (binDiv * 2));
sy = floor(m / (binDiv * 2));

[C, ~, ~] = cropimg_new(I, sx, sy);
secHists = cell(binDiv, binDiv);
imgSet = cell(2, 2);
for i = 1 : binDiv*2 - 1
    for j = 1 : binDiv*2 - 1
        imgSet{1, 1} = C{i, j};
        imgSet{1, 2} = C{i, j+1};
        imgSet{2, 1} = C{i+1, j};
        imgSet{2, 2} = C{i+1, j+1};
        img = drawimg_new(imgSet, sx*2, sy*2);
        secHists{i, j} = histogramGradients(img);
    end
end


end

