%thickness is the size of the padding boarder
function imgout = ICV_padarry(imgin, thickness, mode)%mode defines padding type. 1 padding with zeros.

width = imgin.size();
disp(width);

imgout = zeros(3,3);