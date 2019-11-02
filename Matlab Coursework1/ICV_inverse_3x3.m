%calculates the inverse of a given 3x3 matrix
function matout = ICV_inverse_3x3(mat)


%throws an error if the matrix is not a 3x3
if size(mat,1) ~= 3 || size(mat,2) ~= 3
    error("not a 3x3");
else
    det = ICV_find_det_3x3(mat);
    if det == 0  %if the det is 0 there is no inverse. Returns -1
        matout = -1;
    else 
        transMat = ICV_transpose_square(mat);
        subvalue1 = transMat(2,2)*transMat(3,3) - transMat(2,3)*transMat(3,2);
        subvalue2 = transMat(2,1)*transMat(3,3) - transMat(2,3)*transMat(3,1); 
        subvalue3 = transMat(2,1)*transMat(3,2) - transMat(2,2)*transMat(3,1); 
        subvalue4 = transMat(1,2)*transMat(3,3) - transMat(1,3)*transMat(3,2); 
        subvalue5 = transMat(1,1)*transMat(3,3) - transMat(1,3)*transMat(3,1); 
        subvalue6 = transMat(1,1)*transMat(3,2) - transMat(1,2)*transMat(3,1); 
        subvalue7 = transMat(1,2)*transMat(2,3) - transMat(1,3)*transMat(2,2); 
        subvalue8 = transMat(1,1)*transMat(2,3) - transMat(1,3)*transMat(2,1); 
        subvalue9 = transMat(1,1)*transMat(2,2) - transMat(1,2)*transMat(2,1); 
        matout = (1/det)*[subvalue1,-subvalue2,subvalue3;-subvalue4,subvalue5,-subvalue6;subvalue7,-subvalue8,subvalue9];
    end
end

