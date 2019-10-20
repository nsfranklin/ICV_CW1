function histout = ICV_calc_colour_histogram(imgin, frameNo)
width = size(imgin,1);
height = size(imgin,2);
rgbHist = zeros(255,3);

for x = 1:width
    for y = 1:height
        rgbHist(uint8(imgin(x,y,1))+1,1) = 1 + rgbHist(uint8(imgin(x,y,1))+1,1);
        rgbHist(uint8(imgin(x,y,2))+1,2) = 1 + rgbHist(uint8(imgin(x,y,2))+1,2);
        rgbHist(uint8(imgin(x,y,3))+1,3) = 1 + rgbHist(uint8(imgin(x,y,3))+1,3);
    end
end

histout = rgbHist;