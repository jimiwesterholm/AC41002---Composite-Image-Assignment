function r = sourceToTile(img, sideX, sideY)
%SOURCETOFILE Resize a source image into square of indicated size
%   img - the image
%   sideX - length of X side in pixels
%   sideY - length of Y side in pixels
[x, y, ~] = size(img);
limit = 8;

while (true && sideX > limit && sideY > limit)
    var = min(x, y);
    if (var / 2 <= sideY || var / 2 <= sideX)
        break;
    end
    
    img = impyramid(img, 'reduce');
    [x, y, ~] = size(img);
end
X = floor((x - sideX) / 2);
Y = floor((y - sideY) / 2);
if X == 0
    X = 1;
end
if Y == 0
    Y = 1;
end
imgCropped = imcrop(img, [Y, X, sideX-1, sideY-1]);
r = imgCropped;
%imshow(imgCropped); [(x - side) / 2 , (y - side) / 2, side, side]
%disp((y - side)/2);
end

