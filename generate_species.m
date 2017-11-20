function f = generate_species(natural, manmade)

[~, naturalSize] = size(natural);
[~, manmadeSize] = size(manmade);

for i = 1:naturalSize
    f{i,1}='natural';
end

for i = naturalSize+1:naturalSize+manmadeSize
    f{i,1} = 'manmade';
end

end