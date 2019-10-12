function detout = ICV_find_det_3x3(mat)

if size(mat,1) == 3 && size(mat,2) == 3
    %returns that detminant of a 3x3 mat
    detout = (mat(1,1)*(mat(2,2)*mat(3,3)-(mat(3,2)*mat(2,3)))) + (-mat(1,2)*(mat(2,1)*mat(3,3)-(mat(3,1)*mat(2,3)))) + (mat(1,3)*(mat(2,1)*mat(3,2)-(mat(3,1)*mat(2,2))));

else
   error("Mat Incorrect Dim");
end
