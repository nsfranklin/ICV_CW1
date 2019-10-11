function transOut = ICV_transpose_square(mat)

width = size(mat,1);
height = size(mat,2);

if width ~= height
    error("Non Square matrix not supported");
end

temp = zeros(width, height);

for i = 1:width %loops thought to transpose a given square matrix.
    for j = 1:height
       temp(i,j) = mat(j,i);
    end
end

transOut = temp;