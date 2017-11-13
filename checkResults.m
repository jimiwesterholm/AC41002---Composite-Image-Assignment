function [p, r, m1, m2] = checkResults(results)
m1 =  mean(results(:, 1));
m2 =  mean(results(:, 2));
r = zeros(length(results), 1);
p = zeros(length(results), 1);
for i = 1 : length(results)
    for j = 1 : length(results)
        if results(i, 1) < results(j, 2)
            r(i) = r(i) + 1;
        end
    end
    p(i) = r(i) / length(results);
end


end