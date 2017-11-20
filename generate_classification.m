function result = generate_classification(imgs)

% imgs --> original rgb image without crop or change

[~, s] = size(imgs);
result = cell(s,1);

% easy for test
% s = 20;

for i = 1:s

    img = rgb2gray(imgs{i});
    
    result{i,1} = longestLine(img);

end

end