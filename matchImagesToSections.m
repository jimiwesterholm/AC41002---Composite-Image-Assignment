function images = matchImagesToSections(goals, sources, wc, wg, cb, gb)
%MATCHIMAGESTOSECTIONS Match each section of original image to the best
%matching source image
%   goals - image to be matched against, split into sections. Should be a
%   cell array
%   sources - images to match, converted by sourceToTile. Should be a cell
%   array
%   wc - colour weight
%   wg - gradient weight
%   cb - determines the amount of bins per colour - total bins
%   therefore the value cubed
%   gb - how many sections to split an image into - gradient histograms are taken
%   from these + in between each one



[x, y] = size(goals);
goals2 = reshape(goals, [], 1);
images = cell(x, y);
img = 1:size(goals2);
%values = zeros(size(goals2));
%matched = zeros(size(goals2));
%matchedLogical = zeros(size(sources));
sourceGrad = cell(size(sources));
sourceCol = cell(size(sources));
for i = 1 : length(sources)
    sourceGrad{i} = gradientHistogramsBySections(sources{i}, gb);
    %uncomment for sim
    %sourceGrad{i} = histogramGradients(sources{i});
    sourceCol{i} = colourHist(sources{i}, cb);
end

for i = 1 : size(goals2)
    [colourDist, gradientDist] = measure(goals2{i}, sourceGrad, sourceCol, gb, cb);
    %Find weighted overall best match
    distances = zeros(length(colourDist), 1);
    for j = 1 : length(colourDist)
        distances(j, 1) = colourDist(j, 1) * wc + gradientDist(j, 1) * wg;
    end
    distances = distances - min(distances(:));
    a = find(distances == 0);
    a = a(1);   %If more than one are equal, choose first
    % disp("a: "+a);
    
    %{
    %Ensure no duplicate matches ~all(members < 1
    members = ismember(matched, a);
    if (members(:) < 1)
     %   %disp("All members not < 1");
        b = (img == a);
        index = find(b);
        if (value < values(index))
            img(i) = a;
            matched(i) = a;
            matchedLogical(a) = 1;
      %      %disp("Value less than index: "+a+value);
        else
            index = i;
       %     %disp("Value larger than index");
        end
        %disp("Index: " + index);
        %Find new value for duplicate
        sources2 = sources;
        %disp("mL: "+matchedLogical);   
        sources2(logical(matchedLogical)) = [];
        %disp(sources);
        %disp(sources2);
        [a2, value2] = measure(goals2{index}, sources2);
        %disp("a2: "+a2);
        %Calculate index that matches the original
        counter = 1;
        for n = 1 : length(matchedLogical)
            if matchedLogical(n) == 0
                if counter == a2
                    aFinal = n;
                    %disp("aFinal: "+aFinal);
                    break;
                end
                counter = counter + 1;
            end
        end
        
        matched(i) = aFinal;
        matchedLogical(aFinal) = 1;
        values(index) = value2;
        img(index) = aFinal;
    else
        img(i) = a;
        matched(i) = a;
        matchedLogical(a) = 1;
    end
    %}
    %disp(matchedLogical);
    img(i) = a;
end

%Create cell array of images
counter = 1;
for i = 1 :y
    for j = 1 : x
        images{j, i} = sources{img(counter)};
        counter = counter + 1;
    end
end

end

