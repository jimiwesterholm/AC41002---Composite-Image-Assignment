function [count] = FastAngleFeatures(images)

% give source images, return a cell array that contains angles count in
% each image
% images - source images

[~, s] = size(images);
count = cell(1,s);

for i = 1:s
    gray = rgb2gray(images{1,i});
    corners = detectFASTFeatures(gray);
    count{1,i} = corners.Count;

end


end