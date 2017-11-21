function [ Mdl timing] = generate_classificator_line_hist( natural, manmade)
%PARTB Summary of this function goes here
%   Detailed explanation goes here
tic
species = generate_species(natural, manmade);

% may take a long time
result1 = generate_classification(natural);
result2 = generate_classification(manmade);
result1 = cell2mat(result1);
result2 = cell2mat(result2);

[~, naturalSize] = size(natural);
[~, manmadeSize] = size(manmade);

result(1:naturalSize, 2:9)= generate_colourHist(natural);
result(naturalSize+1:naturalSize+manmadeSize, 2:9) = generate_colourHist(manmade); 
result(1:naturalSize, 1)= result1(:,1);
result(naturalSize+1:naturalSize+manmadeSize, 1) = result2(:,1); 
result(1:naturalSize+manmadeSize,1) = result(1:naturalSize+manmadeSize,1)*1000;


Mdl = fitcknn(result,species,'NumNeighbors',5,'Standardize',1)
timing = toc
end

