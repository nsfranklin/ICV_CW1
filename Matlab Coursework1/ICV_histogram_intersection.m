function intersectout = ICV_histogram_intersection(histo1, histo2)

intersectionout = zeroes(255,3);

for x = 1:255
   intersectionout(x,1) = ICV_abs(histo1(x,1) - histo2(x,1));
   intersectionout(x,2) = ICV_abs(histo1(x,2) - histo2(x,2));
   intersectionout(x,3) = ICV_abs(histo1(x,3) - histo2(x,3));
end
