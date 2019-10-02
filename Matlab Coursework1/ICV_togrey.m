function imgout = ICV_togrey(imgin)

width = size(imgin,1);
height = size(imgin,2);

output = zeros(width,height);

for x = 1:width
    for y = 1:height
        output(x,y) = 0.299*imgin(x,y,1)+0.587*imgin(x,y,1)+0.114*imgin(x,y,3);
    end
end

imgout = output;