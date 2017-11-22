function [ Mdl timing] = generate_classificator_line( natural, manmade)
%PARTB generate a classificator using logest line
% result has already be saved in classificatorLine.mat
tic
species = generate_species(natural, manmade);

% may take a long time
result1 = generate_classification(natural);
result2 = generate_classification(manmade);
result1 = cell2mat(result1);
result2 = cell2mat(result2);

[~, naturalSize] = size(natural);
[~, manmadeSize] = size(manmade);

result(1:naturalSize, :)= result1(1:naturalSize, :);
result(naturalSize+1:naturalSize+manmadeSize, :) = result2(1:manmadeSize,:); 

Mdl = fitcknn(result,species,'NumNeighbors',5,'Standardize',1);
timing = toc;
end

