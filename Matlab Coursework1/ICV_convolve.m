function imgout = ICV_convolve(imgin, mask, matConst) %needs to work on a square matrix of size 3,5,7

width = size(imgin,1);
height = size(imgin,2);
maskwidth = size(mask,1);
maskheight = size(mask,2);

output = zeros(width-((maskwidth-1)),height-((maskheight-1)));

for x = 1+((maskwidth-1)/2):width-((maskwidth-1)/2)
    for y = 1+((maskheight-1)/2):height-((maskheight-1)/2)
        temp = double(0);
        for z = ((maskwidth-1)/-2):((maskwidth-1)/2)
            for i = ((maskheight-1)/-2):((maskheight-1)/2)
                
                temp = temp + imgin(x+z,y+i)*mask(1+z+((maskwidth-1)/2),1+i+((maskheight-1)/2));
                
            end
        end
        temp2 = uint8(temp/matConst);
        output(x-((maskwidth-1)/2),y-((maskheight-1)/2)) = temp2;
    end
end

imgout = output;