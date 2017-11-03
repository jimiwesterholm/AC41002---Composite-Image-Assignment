function images = matchImagesToSections(goals, sources)
%MATCHIMAGESTOSECTIONS Match each section of original image to the best
%matching source image
%   goals - image to be matched against, split into sections. Should be a
%   cell array
%   sources - images to match, converted by sourceToTile. Should be a cell
%   array


[x, y] = size(goals);
goals2 = reshape(goals, [], 1);
images = cell(x, y);
img(size(goals2)) = ' ';
values = zeros(size(goals2));
matched = size(goals2);
%matchedLogical = zeros(size(sources));

for i = 1 : size(goals2)
    [a, value] = measure(goals2{i}, sources);
    disp(a);
    %Ensure no duplicate matches
    members = ismember(matched, a);
    if (~all(members < 1))
        disp("wo");
        b = (img == a);
        index = find(b);
        if (value < values(index))
            img(i) = a;
        else
            index = i;
        end
    
        %Find new value for duplicate
        sources2 = sources;
        disp(all(matched));
        sources2(all(matched)) = [];
        [a2, value2] = measure(goals{index}, sources2);
        matched(index) = a2;
        values(index) = value2;
        img(index) = a2;

    else
        disp("po");
        img(i) = a;
    end
    disp("ro");
    matched(i) = a;
    %matchedLogical(a) = 1;
end

%Create cell array of images
counter = 1;
for i = 1 : x
    for j = 1 : y
        images{i, j} = sources{img(counter)};
        counter = counter + 1;
    end
end

