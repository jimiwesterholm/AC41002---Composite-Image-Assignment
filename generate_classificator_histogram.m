function [ Mdl timing] = generate_classificator_histogram( natural, manmade)
%PARTB Summary of this function goes here
%   Detailed explanation goes here
tic
species = generate_species(natural, manmade);

% may take a long time
% result1 = generate_classification(natural);
% result2 = generate_classification(manmade);
% result1 = cell2mat(result1);
% result2 = cell2mat(result2);

[~, naturalSize] = size(natural);
[~, manmadeSize] = size(manmade);

result(1:naturalSize, 1:8)= generate_colourHist(natural);
result(naturalSize+1:naturalSize+manmadeSize, 1:8) = generate_colourHist(manmade); 


Mdl = fitcknn(result,species,'NumNeighbors',5,'Standardize',1)
timing = toc
end
