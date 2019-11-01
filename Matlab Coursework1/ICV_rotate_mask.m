function maskOut = ICV_rotate_mask(mask) %all my masks are symetric I have included this for completeness 

maskwidth = size(mask,1);
maskheight = size(mask,2);

output = size(maskwidth,maskheight);

for i = 1:maskwidth
    for j = 1:maskheight
        output(i,j) = mask(maskwidth+1-i,maskheight+1-j);
    end
end

disp(output);
maskOut = output