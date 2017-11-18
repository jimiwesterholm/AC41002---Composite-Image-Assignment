function distance = hisdistance(gHist1, gHist2)

    % gHist1 --> the expected one
    % gHist2 --> the testing one

    distance = 0;
    
    s = size(gHist1);
    for i = 1:s
        if gHist1(i)==0
            gHist1(i) = 0.1;
        end
        distance = distance + ((gHist1(i)-gHist2(i))^2)/gHist1(i);
    end
    
    distance = sqrt(distance);

end