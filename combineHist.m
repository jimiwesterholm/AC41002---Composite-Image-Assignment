function [ h ] = combineHist( hs )
%COMBINEHIST Summary of this function goes here
%   Detailed explanation goes here
h = zeros(length(hs{1}), 1);
for i = 1 : length(hs)
    hn = hs{i};
    for j = 1 : length(hs{i})
        h(j) = h(j) + hn(j);
    end
end

end

