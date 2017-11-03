function results = sourcesToTiles(sources, sideX, sideY)
%SOURCESTOTILES Summary of this function goes here
%   Detailed explanation goes here

results = cell(1, length(sources));
for i = 1 : length(sources)
    results {i} = sourceToTile(sources{i}, sideX, sideY);
end

end

