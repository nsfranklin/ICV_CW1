%Performs a convolution by check if a mask is symatric if it is the mask is
%rotated then a correlation is performed.
function imgout = ICV_convolve(imgin, mask, matConst) %needs to work on a square matrix of size 3,5,7

width = size(imgin,1);
height = size(imgin,2);
maskwidth = size(mask,1);
maskheight = size(mask,2);

if ICV_isMaskSymetric(mask) ~= true %if mask is not symetric rotates the mask then applies correlation. using rotated mask.
    mask = ICV_rotate_mask(mask);
end                                 %if mask is symetric correlation == convolution


output = zeros(width-((maskwidth-1)),height-((maskheight-1))); %Creates output mat removing padding width. Assumes masks are of an odd width

for x = 1+((maskwidth-1)/2):width-((maskwidth-1)/2) %applies the mask to the image using correlation
    for y = 1+((maskheight-1)/2):height-((maskheight-1)/2)
        temp = double(0);
        for z = ((maskwidth-1)/-2):((maskwidth-1)/2)
            for i = ((maskheight-1)/-2):((maskheight-1)/2)
                temp = temp + imgin(x+z,y+i)*mask(1+z+((maskwidth-1)/2),1+i+((maskheight-1)/2));
            end
        end
        temp2 = uint8(temp/matConst); %applies the mat constant and converts back to uint8
        output(x-((maskwidth-1)/2),y-((maskheight-1)/2)) = temp2;
    end
end

imgout = output; %returns filtered image without padding