
a = 128;
b = 128;
goalImg = imread('D:\Computer Vision\manmade_training\out_manmade_1k\sun_aajdfgomwuyaybdx,jpg\\');
path = 'D:\Computer Vision\manmade_training\out_manmade_1k';
[sourceImg len] = importimg(path);

[goal width height] = cropimg_new(goalImg, a, b);
sources = sourcesToTiles(sourceImg, b, a);
img = measure(goal, sources);
img = drawimg_new(img,width, height);
imshow(img);