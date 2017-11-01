function f = cropimg(I, sx, sy, i)

% I --> Image
% sx --> size in width
% sy --> size in height
% i --> number
[m, n, ~] = size(I);

column = ceil(m/sx);
row = ceil(n/sy);

% end of the row
remainder = mod(i,column);

% end of the column
remainder2 = (i>(row-1)*column);



x = ((mod(i,column)-1)*sx)
y = (floor((i-1)/column)*sy)
sizex = sx;
sizey = sy;

if remainder==0 && remainder2
    x = (column-1)*sx;
    y = (row-1)*sy;
    sizex = m-x;
    sizey = n-y;
elseif remainder==0
    x = (column-1)*sx;
    sizex = m-x;
elseif remainder2
    y = (row-1)*sy;
    sizey = n-y;
end

f = imcrop(I,[x,y,sizex,sizey]);

end