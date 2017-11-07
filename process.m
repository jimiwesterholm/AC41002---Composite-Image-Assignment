a = 64;
b = 64;
%{
%goalImg = imread('C:\Users\jimiwesterholm\Documents\MATLAB\out_manmade_1k\sun_aakhloyzxmmeyqdv.jpg');
path = 'C:\Users\jimiwesterholm\Documents\MATLAB\out_manmade_1k\\';
[sourceImg len] = importimg(path);
%}
[goal width height] = cropimg_new(goalImg, a, b);
sources = sourcesToTiles(sourceImg, b, a);
%img = measure(goal, sources);

img = matchImagesToSections(goal, sources);
img = drawimg_new(img,width, height);
imshow(img);