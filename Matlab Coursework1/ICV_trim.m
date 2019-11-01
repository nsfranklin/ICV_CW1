function output = ICV_trim(imgin) %trims the black space on the top and bottom of the image.

width = size(imgin, 1); %finds image width and height for future use
height = size(imgin, 2);

horizontalBefore = 0;
horizontalBeforeEnd = false;
horizontalAfter = 0;
verticleBefore = 0;
verticleBeforeEnd = false;
verticleAfter = 0;

for i = 1:width
    for j = 1:height
        if ~horizontalBeforeEnd
            
        else
            
        end
        
        if ~verticleBeforeEnd
            
        else
            
        end
    end
end

%Reconstructs the trimmed version of the image.

output = imgin;