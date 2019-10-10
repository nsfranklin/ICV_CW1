function matout = ICV_inverse_3x3(mat)

if size(mat,1) ~= 3 || size(mat,2) ~= 3
    matout = -1;
else
    det = ICV_find_det_3x3(mat);
    if det == 0  %if the det is 0 there is no inverse. Returns -1
        matout = -1;
    else 
        transMat = ICV_transpose(mat);
        
    end
end
    
