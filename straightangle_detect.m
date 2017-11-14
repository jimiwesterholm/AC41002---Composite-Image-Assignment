function [count line] = straightangle_detect(img)

% detect lines from img
img = rgb2gray(img);

edges = edge(img, 'canny');

[ihough theta rho] = hough(edges);

peaks = houghpeaks(ihough, 10000, 'Threshold', 0.2*max(ihough(:)));

lines = houghlines(edges, theta, rho, peaks, 'MinLength', 20, 'FillGap',5);


[p num] = size(lines);

% detect if they are stright angle
% theta1 <= 0 && theta2 > 0 && theta1 + theta2 == 90
% ignore whether they intersect to each other or not.
count = 0;

line = cell(1,1);

for i=1:num

    for j = i:num
        
        flag = 0;
        
        % detect the angle
        theta1 = lines(i).theta;
        theta2 = lines(j).theta
        
        if theta1<=0 && theta2>=0 && theta2-theta1>=89 && theta2-theta1<=91
            
            flag = 1;
        end
        
        if theta1>0 && theta2<=0 && theta1-theta2>=89 && theta1-theta2<=91
            
            flag = 1;
        
        
        end
        
        if flag == 1
            
           p1 = lines(i).point1;
           p2 = lines(i).point2;
           p3 = lines(j).point1;
           p4 = lines(j).point2;
           
           if point_near(p1,p3)==1 || point_near(p1,p4)==1 || point_near(p2,p3)==1||point_near(p2,p4)==1
               imshow(img);
           
            count = count + 1;
            line{1,count} = p1;
            line{2,count} = p2;
            line{3,count} = p3;
            line{4,count} = p4;
            line{5,count} = theta1;
            line{6,count} = theta2;
           
           end
            
        
        end
    
    
    end

end



end