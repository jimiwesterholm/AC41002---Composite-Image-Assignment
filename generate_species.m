function f = generate_species()

for i = 1:500
    f{i,1}='natural';
end

for i = 501:1000
    f{i,1} = 'manmade';
end

end