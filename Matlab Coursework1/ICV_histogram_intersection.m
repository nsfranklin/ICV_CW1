% creates the intersection histogram and finds the total number of channel
% pixels that intersect and the model total used to normalize the
% intersection total.
function [intersectionHistoOut, intersectionPercent] = ICV_histogram_intersection(hist1, hist2) 
intersectionHistoOut = zeros(256,3);
pixelTotalOut = 0;
modelTotal = 0;

%loops though incrementing the values for each pixel to form the
%intersection histograms and finding the normilized intersection percentage
for x = 1:256
    %channel 1 Red
    if hist1(x,1) < hist2(x,1)
        intersectionHistoOut(x,1) = hist1(x,1);
        pixelTotalOut = pixelTotalOut + hist1(x,1);
    else
        intersectionHistoOut(x,1) = hist2(x,1);
        pixelTotalOut = pixelTotalOut + hist2(x,1);
    end
    %channel 2 Green
    if hist1(x,2) < hist2(x,2)
        intersectionHistoOut(x,2) = hist1(x,2);
        pixelTotalOut = pixelTotalOut + hist1(x,2);
    else
        intersectionHistoOut(x,2) = hist2(x,2);
        pixelTotalOut = pixelTotalOut + hist2(x,2);
    end
    %channel 3 Blue
    if hist1(x,3) < hist2(x,3)
        intersectionHistoOut(x,3) = hist1(x,3);
        pixelTotalOut = pixelTotalOut + hist1(x,3);
    else
        intersectionHistoOut(x,3) = hist2(x,3);
        pixelTotalOut = pixelTotalOut + hist2(x,3);
    end
end
 %Calculates the total of number of pixels in the model frames histogram 
for x = 1:256
    modelTotal = modelTotal + hist2(x,1);
    modelTotal = modelTotal + hist2(x,2);
    modelTotal = modelTotal + hist2(x,3); 
end

intersectionPercent = pixelTotalOut/modelTotal;