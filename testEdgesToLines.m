function [ ratios, failures ] = testEdgesToLines( natural, manmade, offset, amount, measure)
%TESTEDGESTOLINES Summary of this function goes here
%   Detailed explanation goes here
ratios = zeros(amount, 2);
failures = zeros(amount, 1);
for i=(offset+1) : amount + offset
    a = edgesToLinesRatio(rgb2gray(manmade{1, i}), measure);
    b = edgesToLinesRatio(rgb2gray(natural{1, i}), measure);
    if a > b
        failures(i) = 1;
    end
    ratios(i, 1) = a;
    ratios(i, 2) = b;
end

end

