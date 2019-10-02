function histout = ICV_calc_colour_histogram(imgin)

width = size(imgin,1);
height = size(imgin,2);
rgbHist = zeros(256,3);

disp(rgbHist);
disp(imgin(1,1,1));
for x = 1:width
    for y = 1:height
        rgbHist(imgin(x,y,1),1) = 1; %1 + rgbHist(imgin(x,y,1),1);
        rgbHist(imgin(x,y,2),2) = 1; %+ rgbHist(imgin(x,y,2),2);
        rgbHist(imgin(x,y,3),3) = 1; %+ rgbHist(imgin(x,y,3),3);
    end
end

histout = rgbHist;