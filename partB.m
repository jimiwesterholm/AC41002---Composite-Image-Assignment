function [ Mdl ] = partB( natural, manmade)
%PARTB Summary of this function goes here
%   Detailed explanation goes here

species = generate_species(natural, manmade);

% may take a long time
% result1 = generate_classfication(natural);
% result2 = generate_classfication(manmade);

[~, naturalSize] = size(natural);
[~, manmadeSize] = size(manmade);

result(1:naturalSize, :)= result1(1:naturalSize, :);
result(naturalSize+1:naturalSize+manmadeSize, :) = result2(1:manmadeSize,:); 


Mdl = fitcknn(result,species,'NumNeighbors',5,'Standardize',1)

end

