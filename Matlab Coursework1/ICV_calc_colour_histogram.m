%calculates the colour histogram for a given frame. (don't remember why I
%passed in the frame number.
function histout = ICV_calc_colour_histogram(imgin, frameNo)
width = size(imgin,1);
height = size(imgin,2);
rgbHist = zeros(256,3); %create and matrix to store frequences

for x = 1:width %loop though each pixel in the image
    for y = 1:height
        rgbHist(uint16(imgin(x,y,1))+1,1) = 1 + rgbHist(uint16(imgin(x,y,1))+1,1); %increments the matrix at the index of the colour of pixel
        rgbHist(uint16(imgin(x,y,2))+1,2) = 1 + rgbHist(uint16(imgin(x,y,2))+1,2);
        rgbHist(uint16(imgin(x,y,3))+1,3) = 1 + rgbHist(uint16(imgin(x,y,3))+1,3);
    end
end

histout = rgbHist;