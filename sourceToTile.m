function r = sourceToTile(img, side)
%sourceToFile Resize a source image into square of indicated size
%   img - the image
%   side - length of one side in pixels
[x, y, dim] = size(img);

while (true && side > 1)
    var = min(x, y);
    if (var / 2 <= side)
        break;
    end
    
    img = impyramid(img, 'reduce');
    [x, y, dim] = size(img);
end
X = floor((x - side) / 2);
Y = floor((y - side) / 2);
imgCropped = imcrop(img, [Y, X, side-1, side-1]);
r = imgCropped;
%imshow(imgCropped); [(x - side) / 2 , (y - side) / 2, side, side]
%disp((y - side)/2);
end

