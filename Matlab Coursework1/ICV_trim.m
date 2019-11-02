function output = ICV_trim(imgin) %trims the black space on the top and bottom of the image.

width = size(imgin, 1); %finds image width and height for future use
height = size(imgin, 2);

horizontalBeforeFound = false;
horizontalBefore = 0;
horizontalAfter = 0;

verticleBeforeFound = false;
verticleBefore = 0;
verticleAfter = 0;

%Reconstructs the trimmed version of the image.
disp(max(imgin(1,:)));
disp(max(imgin(:,1)));
for i = 1:width
   if horizontalBeforeFound == false
       if max(imgin(i,:)) == 0 %any row of column with a max value of -1 is empty and can be trimmed.
            horizontalBefore = horizontalBefore + 1;
       else
            horizontalBeforeFound = true;
       end
   else
       if max(imgin(i,:)) == 0 %any row of column with a max value of -1 is empty and can be trimmed.
            horizontalAfter = horizontalAfter + 1;
       end      
   end
end

for j = 1:height
   if verticleBeforeFound == false
       if max(imgin(:,j)) == 0 %any row of column with a max value of -1 is empty and can be trimmed.
            verticleBefore = verticleBefore + 1;
       else
            verticleBeforeFound = true;
       end
   else
       if max(imgin(:,j)) == 0 %any row of column with a max value of -1 is empty and can be trimmed.
            verticleAfter = verticleAfter + 1;
       end      
   end
end

%removes the found extra edges.

if horizontalBefore == 0 && horizontalAfter == 0 && verticleBefore == 0 && verticleAfter == 0
    disp("Here")
    output = imgin;
else
    output = imgin(horizontalBefore+1:width-horizontalAfter,verticleBefore+1:height-verticleAfter,:); 
end