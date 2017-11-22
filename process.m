a = 64;
b = 64;

goalImg = imread('C:\Users\jimi\Documents\GitHub\AC41002---Composite-Image-Assignment\Images\target.jpg');
path = 'C:\Users\jimi\Documents\GitHub\AC41002---Composite-Image-Assignment\Images\Images\s\\';
path2 = 'C:\Users\jimi\Documents\GitHub\AC41002---Composite-Image-Assignment\Images\Images\natural_training\\';
[sources len] = importimg(path);
%[sourceNatural len2] = importimg(path2);

[goal width height] = cropimg_new(goalImg, a, b);
sources = sourcesToTiles(sources, b, a);
%img = measure(goal, sources);
%{
img = matchImagesToSections(goal, sources);
img = drawimg_new(img,width, height);
imshow(img);
%}