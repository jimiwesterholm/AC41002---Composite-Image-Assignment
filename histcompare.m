function [distances] = histcompare(hist1,hist2)
%HISTCOMPARE Summary of this function goes here
%   Detailed explanation goes here

[a, b] = size(hist1);
distances = zeros(a, b);
for i = 1 : a
    for j = 1 : b
        distances(i, j) = pdist2(hist1{i, j}', hist2{i, j}');
        %{
        Manually:
        for k = 1 : 9 %the number of directional bins
            %get distance for each bin
        end
        %}
        
    end
end

end

