function colourout = ICV_find_1NN_colour(candidate, image)

    %disp(candidate(1));
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
        rout = 0;
        gout = 0;
        bout = 0;
        
        %if image(x+1,y)
        %if image(x,y+1)
        %if image(x-1,y)
        %if image(x,y-1)
            
        %if image(x+1,y+1)
        %if image(x+1,y+1)
        %if image(x+1,y-1)
        %if image(x-1,y+1)
            
            
        if 1 ~= 1  
            
        
        else %if nn fails averages the 8 pixel neighbourhood to assign the colour
            rout = image(x+1,y,1) + image(x,y+1,1) + image(x-1,y,1) +  image(x,y-1,1) + image(x+1,y+1,1) + image(x+1,y+1,1) + image(x+1,y-1,1) + image(x-1,y+1,1);
            gout = image(x+1,y,2) + image(x,y+1,2) + image(x-1,y,2) +  image(x,y-1,2) + image(x+1,y+1,2) + image(x+1,y+1,2) + image(x+1,y-1,2) + image(x-1,y+1,2);
            bout = image(x+1,y,3) + image(x,y+1,3) + image(x-1,y,3) +  image(x,y-1,3) + image(x+1,y+1,3) + image(x+1,y+1,3) + image(x+1,y-1,3) + image(x-1,y+1,3); 
        end
        colourout(1) = uint8(round(rout/8));
        colourout(2) = uint8(round(gout/8));
        colourout(3) = uint8(round(bout/8));    
    end