function [c len] = importimg(path)

files = dir(strcat(path,'*.jpg'));
len = length(files);
c = cell(1,len);
for i = 1:len
    c{i} = imread(strcat(path,files(i).name));
end