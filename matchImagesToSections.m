function images = matchImagesToSections(goals, sources)
%MATCHIMAGESTOSECTIONS Match each section of original image to the best
%matching source image
%   goals - image to be matched against, split into sections. Should be a
%   cell array
%   sources - images to match, converted by sourceToTile. Should be a cell
%   array

img(size(goals)) = ' ';
values = zeros(size(goals));
[x, y] = size(goals);
matched = zeros(x, y);
matchedLogical = zeros(size(sources));

for i = 1 : x
    for j = 1 : y
        [a, value] = measure(goals{i, j}, sources);
        disp(a);
        %Ensure no duplicate matches
        members = ismember(matched, a);
        if (~all(members(:) < 1))
            disp("wo");
            b = (img == a);
            index = find(b);
            if (value < values(index))
                img(i, j) = a;
            else
                index = [i, j];
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
            img(i, j) = a;
        end
        disp("ro");
        matched(i, j) = a;
        matchedLogical(a) = 1;
    end
end

%Create cell array of images
for i = 1 : x
    for j = 1 : y
        images{i} = sources{img(i)};
    end
end

