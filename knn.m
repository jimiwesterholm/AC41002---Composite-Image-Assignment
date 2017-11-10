function Md1 = knn(testCell, species)


% error testCell must be numeric matrix
Mdl = fitcknn(testCell,species,'NumNeighbors',5,'Standardize',1)

end