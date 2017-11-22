function [ Mdl timing] = generate_classificator_histogram( natural, manmade)
%PARTB generate a classificator using rgb histogram
% result already saved in classificatorHistogram.mat
tic
species = generate_species(natural, manmade);

[~, naturalSize] = size(natural);
[~, manmadeSize] = size(manmade);

result(1:naturalSize, 1:8)= generate_colourHist(natural);
result(naturalSize+1:naturalSize+manmadeSize, 1:8) = generate_colourHist(manmade); 

Mdl = fitcknn(result,species,'NumNeighbors',5,'Standardize',1)
timing = toc
end

