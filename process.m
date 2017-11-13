a = 64;
b = 64;

goalImg = imread('C:\Users\jimiwesterholm\Documents\MATLAB\out_manmade_1k\sun_aakhloyzxmmeyqdv.jpg');
path = 'C:\Users\jimiwesterholm\Documents\MATLAB\out_manmade_1k\\';
path2 = 'C:\Users\jimiwesterholm\Documents\MATLAB\out_natural_1k\\';
[sourceManmade len] = importimg(path);
[sourceNatural len2] = importimg(path2);
%{
[goal width height] = cropimg_new(goalImg, a, b);
sources = sourcesToTiles(sourceImg, b, a);
%img = measure(goal, sources);

img = matchImagesToSections(goal, sources);
img = drawimg_new(img,width, height);
imshow(img);
%}