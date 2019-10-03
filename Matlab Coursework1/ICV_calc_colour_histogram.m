function histout = ICV_calc_colour_histogram(imgin)
width = size(imgin,1);
height = size(imgin,2);
rgbHist = zeros(256,3);

for x = 1:width-1
    for y = 1:height-1
        rgbHist(uint8(imgin(x,y,1)),1) = 1 + rgbHist(uint8(imgin(x,y,1)),1);
        rgbHist(uint8(imgin(x,y,2)),2) = 1 + rgbHist(uint8(imgin(x,y,2)),2);
        rgbHist(uint8(imgin(x,y,3)),3) = 1 + rgbHist(uint8(imgin(x,y,3)),3);
    end
end

histout = rgbHist;