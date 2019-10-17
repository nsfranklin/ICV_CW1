function matout = ICV_min_hist(hist1,hist2)

matout = zeros(3);

if hist1(1) < hist2(1)
    matout(1) = hist1(1);
else
    matout(1) = hist2(1);
end
if hist1(2) < hist2(2)
    matout(2) = hist2(2);
else
    matout(2) = hist2(2);
end
if hist1(3) < hist2(3)
    matout(3) = hist1(3);
else
    matout(3) = hist2(3);
end