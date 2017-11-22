function img = crop(source, set)

img = source(set(1):set(1)+set(3), set(2):set(2)+set(4),:);

end