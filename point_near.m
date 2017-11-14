function f = point_near(p1, p2)

f = 0;

if p1(1)-p2(1)<5 && p1(1)-p2(1)>-5 && p1(2)-p2(2)<5 && p1(2)-p2(2)>-5

    f = 1;
    
end

end