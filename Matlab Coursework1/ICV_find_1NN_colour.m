%finds the 1NN to a given reverse transformed point. in the given original
%image.
function colourout = ICV_find_1NN_colour(candidate, image)

    x = round(candidate(1)); %the position of holes after inverse transformation
    y = round(candidate(2));
    
    width = size(image,1);
    height = size(image,2);
    
    colourout = zeros(3);

    if (x >= width || y >= height) || (x <= 1 || y <= 1)
        colourout(1) = 0;
        colourout(2) = 0;
        colourout(3) = 0;
    else
        colourout(1) = image(x,y,1); %a very  simple 1nn as rounding the candidate moves the candicate to the 1NN.
        colourout(2) = image(x,y,2);
        colourout(3) = image(x,y,3);
    end
   
    
    