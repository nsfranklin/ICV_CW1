function colourout = ICV_find_1NN_colour(candidate, image)

    %disp(candidate);
    x = round(candidate(1));
    y = round(candidate(2));
    
    width = size(image,1);
    height = size(image,2);
    
    %disp(x);
    %disp(y);
    colourout = zeros(3);

    if (x > width || y > height) || (x < 1 || y < 1)
        colourout(1) = 0;
        colourout(2) = 0;
        colourout(3) = 0;
    else
        disp("colour found");
        colourout(1) = image(x,y,1);
        colourout(2) = image(x,y,2);
        colourout(3) = image(x,y,3);    
    end