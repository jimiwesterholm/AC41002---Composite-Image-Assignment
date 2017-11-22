function img = drawimg_new(C, width, height)

% give source images, and composite them into a new image.
% C - cell array that contains the images in same size
% width - width of target image
% height - height of target image

img = ones(height, width, 3, 'uint8');

[m,n] = size(C);
[sy,sx,~] = size(C{1,1});

for i = 1:m
    for j = 1:n
        img((i-1)*sy+1:i*sy, (j-1)*sx+1:j*sx,:) = C{i,j};
    end
end
end