classdef SimilarityManager
    %SIMILARITYMANAGER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        binSize
    end
    
    methods
        function obj = setProperty(obj, value, p)
            obj.(p) = value;
        end
        
        function o = getProperty(obj,p)
            o = obj.(p);
        end
        
        function [img, lowestValue] = measureSimilarity(goal, sources)
            %MEASURESIMILARITY Get histograms of source images, return the best match
            %   goal - section of the original image
            %   sources - source images to be matched

            %Add normalisation? Might not be needed since each image is already the
            %same size - same number of pixels
            lowestValue = Inf;
            gHist = imhist(goal);
            for i = 1 : length(sources)
                distance = pdist2(imhist(sources{i})', gHist');
                if distance < lowestValue
                    lowestValue = distance;
                    img = i;
                end
            end
        end
        
        function [img, lowestValue] = measureSimilarityColour(obj, goal, sources)
            %MEASURE Get histograms of source images, return the best match
            %   obj - the SimilarityManager object
            %   goal - section of the original image
            %   sources - source images to be matched

            %Add normalisation? Might not be needed since each image is already the
            %same size - same number of pixels

            lowestValue = Inf;
            gHist = colourHist(goal, obj.binSize);

            for i = 1 : length(sources)
                distance = pdist2(colourHist(sources{i}, 3)', gHist');
                if distance < lowestValue
                    lowestValue = distance;
                    img = i;
                end
            end
        end
        
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
            img = 1:size(goals2);
            values = zeros(size(goals2));
            matched = zeros(size(goals2));
            matchedLogical = zeros(size(sources));

            for i = 1 : size(goals2)
                [a, value] = measureSimilarity(goals2{i}, sources);
                %disp("a: "+a);

                %Ensure no duplicate matches
                members = ismember(matched, a);
                if (~all(members < 1))
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
                    [a2, value2] = measureSimilarity(goals{index}, sources2);
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
                %disp(matchedLogical);
            end

            %Create cell array of images
            counter = 1;
            for i = 1 : x
                for j = 1 : y
                    images{i, j} = sources{img(counter)};
                    counter = counter + 1;
                end
            end
        end
    end
end

