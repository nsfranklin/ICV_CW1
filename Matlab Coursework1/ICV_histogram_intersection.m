function intersectionout = ICV_histogram_intersection(hist1, hist2)

intersectionout = 0;

for x = 1:255
    if hist1(x,1) < hist2(x,1)
        intersectionout = intersectionout + hist1(x,1);
    else
        intersectionout = intersectionout + hist2(x,1);
    end
    
    if hist1(x,2) < hist2(x,2)
        intersectionout = intersectionout + hist1(x,2);
    else
        intersectionout = intersectionout + hist2(x,2);
    end
    
    if hist1(x,3) < hist2(x,3)
        intersectionout = intersectionout + hist1(x,3);
    else
        intersectionout = intersectionout + hist2(x,3);
    end
end

for x = 1:256
    histTotal = histTotal + hist2
end
intersectionout