function boolOut = ICV_isMaskSymetric(mask) % tests if a given mask is symetrical input is a kernel and output is boolean true if symetric.
maskwidth = size(mask,1);
maskheight = size(mask,2);
boolOut = true;

for i = 1:maskwidth %tests the symetry of the mask. breaking out if the mask fails.
    for j = i:maskheight
        if mask(i,j) ~= mask(j,i)
            boolOut = false;
            break;
        end 
    end
    if boolOut == false
        break;
    end
end