function [C width height] = cropimg_new(I, sx, sy)

% give a target image, crop it into given size
% cut image to center, not concern the edge part
% return cell array, width and height

% I - target image
% sx - cut to width
% sy - cut to height

[m, n, ~] = size(I);

column = floor(n/sx);
row = floor(m/sy);

C = cell(row, column);

edgex = mod(n, sx);
edgey = mod(m, sy);

for i = 1:row
    for j = 1:column
        x = edgex+(j-1)*sx+1;
        y = edgey+(i-1)*sy+1;
        C{i,j} = imcrop(I,[x,y,sx-1,sy-1]);
    end
end
width = sx*column;
height = sy*row;