%thickness is the size of the padding boarder
function imgout = ICV_padarry(imgin, thickness, mode)%mode defines padding type. 1 padding with zeros.

width = size(imgin,1);
height = size(imgin,2);

if mode == 1
    output = zeros(width+2*thickness, height+2*thickness);

    for x = 1:width+2*thickness
        for y = 1:height+2*thickness
            if (x > thickness & y > thickness) & (x <= width + thickness & y <= height + thickness) 
                temp = imgin(x - thickness, y - thickness);
                output(x,y) = temp; 
            end
        end
    end
end


imgout = output;