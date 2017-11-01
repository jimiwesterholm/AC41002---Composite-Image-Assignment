function r = sourceToTile(img, side)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[x, y, dim] = size(img);

while (true)
    var = min(x, y);
    if (var / 2 < side)
        break;
    end
    
    img = impyramid(img, 'reduce');
    [x, y, dim] = size(img);
end
imgCropped = imcrop(img, [0, 0, side, side]);
r = imgCropped;
imshow(imgCropped);
end

