function boolOut = ICV_isMaskSymetric(mask)
maskwidth = size(mask,1);
maskheight = size(mask,2);
boolOut = true;

for i = 1:maskwidth
    for j = i:maskheight
        if mask(i,j) ~= mask(j,i)
            boolOut = false;
        end 
    end
end