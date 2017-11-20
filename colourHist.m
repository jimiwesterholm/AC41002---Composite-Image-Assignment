function h = colourHist(img, binSize)
%COLOURHIST Computes a histogram that takes into account the relationships
%between colours
%   img - the image the histogram will be created from
%   binSize - Bins per RGB channel - actual amount of bins will therefore
%   be binSize^3

[x, y, ~] = size(img);
h = zeros([binSize*binSize*binSize, 1]);
div = 256/(binSize - 1);

for i=1 : x
    for j=1 : y
        r = floor(img(i, j, 1)/div);
        g = floor(img(i, j, 2)/div);
        b = floor(img(i, j, 3)/div);
        index = r*binSize*binSize + g*binSize + b + 1;
        %disp(index);
        h(index) = h(index) + 1;
    end
end

end

