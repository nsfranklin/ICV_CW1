function imgout = ICV_horizontal_skew(imgin, angle)

angle = -90 + angle;

x = 1/tand(angle);
width = size(imgin,1);
height = size(imgin,2);

transPixPos = zeros(width,height,2); %Temp storage of transformed values
skewMat = [1,0,0;x,1,0;0,0,1]; %Skew Matrix as per matlab docs.

for x = 0:width-1
    for y = 0:height-1
       temp = skewMat*[x;y;1]; 
       transPixPos(x+1,y+1,1) = temp(1);
       transPixPos(x+1,y+1,2) = temp(2);
    end
end
for i = 1:width
    for j = 1:height
       transPixPos(i,j,1) = round(transPixPos(i,j,1));
       transPixPos(i,j,2) = round(transPixPos(i,j,2));
    end
end
xMax = max(max(transPixPos(:,:,1))); %shifts the points back into positive world coords
yMax = max(max(transPixPos(:,:,2)));
xMin = min(min(transPixPos(:,:,1)));
yMin = min(min(transPixPos(:,:,2)));

output = zeros(xMax-xMin+1,yMax-yMin+1,3); %creates a matrix to output the final image to.
outputWidth = size(output,1);
outputHeight = size(output,2);

c{outputWidth,outputHeight,2,3} = []; %value 3 is the depth it is set at 2 so that matlab doesn't collapse this dimension
for i = 1:width %Cell arrays used to find and resolve overlayed pixels. Fills Cell were depth marks overlaying pixels.
    for j = 1:height
        count = 1;
        %disp(transPixPos(i,j,1)+1-xMin);
        %disp(transPixPos(i,j,2)+1-yMin);
        while true
            if count + 1 > size(c,3) %increases the depth of the cell array if count greater than its depth
                c{i,j,count+1,3} = [];
                disp("<--");
                disp(c{transPixPos(i,j,1)+1-xMin,transPixPos(i,j,2)+1-yMin,count,1});
                disp("-->");
            end            
            if isempty(c{transPixPos(i,j,1)+1-xMin,transPixPos(i,j,2)+1-yMin,count,1})
                c{transPixPos(i,j,1)+1-xMin,transPixPos(i,j,2)+1-yMin,count,1} = imgin(i,j,1);
                c{transPixPos(i,j,1)+1-xMin,transPixPos(i,j,2)+1-yMin,count,2} = imgin(i,j,2);
                c{transPixPos(i,j,1)+1-xMin,transPixPos(i,j,2)+1-yMin,count,3} = imgin(i,j,3);
                break;
            end
            count = count + 1;
        end
    end
end

for k = 1:width
    for l = 1:height
        output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,1) = imgin(k,l,1);
        temp = imgin(k,l,2); 
        output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,2) = temp;
        output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,3) = imgin(k,l,3); 
    end
end

output = ICV_trim(output); %trims the extended black portion of the image.

imgout = output;