%trims the black space on the top, bottom, left and right of the image.
function output = ICV_trim(imgin)

width = size(imgin, 1); %finds image width and height for future use
height = size(imgin, 2);

horizontalBeforeFound = false;
horizontalBefore = 0;
horizontalAfter = 0;

verticleBeforeFound = false;
verticleBefore = 0;
verticleAfter = 0;

%Reconstructs the trimmed version of the image.

for i = 1:width
   if horizontalBeforeFound == false
       if max(imgin(i,:)) == 0 %any row of column with a max value of 0 is empty and can be trimmed.
            horizontalBefore = horizontalBefore + 1;
       else
            horizontalBeforeFound = true;
       end
   else
       if max(imgin(i,:)) == 0 %any row of column with a max value of 0 is empty and can be trimmed.
            horizontalAfter = horizontalAfter + 1;
       end      
   end
end

for j = 1:height
   if verticleBeforeFound == false
       if max(imgin(:,j)) == 0 %any row of column with a max value of 0 is empty and can be trimmed.
            verticleBefore = verticleBefore + 1;
       else
            verticleBeforeFound = true;
       end
   else
       if max(imgin(:,j)) == 0 %any row of column with a max value of 0 is empty and can be trimmed.
            verticleAfter = verticleAfter + 1;
       end      
   end
end

%removes the found extra edges.
%if nothing to remove was found input is returned.
if horizontalBefore == 0 && horizontalAfter == 0 && verticleBefore == 0 && verticleAfter == 0
    output = imgin;
else
    %crop range in returned.
    output = imgin(horizontalBefore+1:width-horizontalAfter,verticleBefore+1:height-verticleAfter,:); 
end