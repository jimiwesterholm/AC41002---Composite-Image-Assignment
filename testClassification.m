function count = testClassification(Mdl, natural, manmade, speciesSet)

count = 0;
natural = natural(:,101:200);
manmade = manmade(:,101:200);

for i = 1:100
    target = natural{1,i};
    targetgray = rgb2gray(target);
    longest = longestLine(targetgray)*1000;
    gHist = colourHist(target,2);
    input = [longest, gHist'];
    input = reshape(input(1:9),[],9);
    
    result = predict(Mdl,input);
    
    
    if result{1,1} == speciesSet{i,1};
        count=count+1;
    end
end

end