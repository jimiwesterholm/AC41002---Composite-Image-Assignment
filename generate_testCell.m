function [testCell len] = generate_testCell(testCell1, testCell2)

testCell = cell(1000,1);

for i = 1:500
    testCell{i,1} = testCell1{i,1};
end

for j = 1:500
    testCell{j+500,1} = testCell2{j,1};
end

end


