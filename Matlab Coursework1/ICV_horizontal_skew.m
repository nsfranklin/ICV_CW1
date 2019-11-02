%performs a horizontal skew with the angle between the verticle axis and
%the new edge of the image.
function imgout = ICV_horizontal_skew(imgin, angle)

%factor to similate skew from bottom left
angle = -90 + angle;

x = 1/tand(angle);
width = size(imgin,1);
height = size(imgin,2);

transPixPos = zeros(width,height,2); %Temp storage of transformed values
skewMat = [1,0,0;x,1,0;0,0,1]; %Skew reflected skew matrix. Because width and height are swapped.

%applying the transformation to each pixel position and storing the new
%location.
for x = 0:width-1
    for y = 0:height-1
       temp = skewMat*[x;y;1]; 
       transPixPos(x+1,y+1,1) = round(temp(1));
       transPixPos(x+1,y+1,2) = round(temp(2));
    end
end

xMax = max(max(transPixPos(:,:,1))); %calulating max and min of edge dimension
yMax = max(max(transPixPos(:,:,2))); %Used to move the points back into positive back into positive world if they move out.
xMin = min(min(transPixPos(:,:,1)));
yMin = min(min(transPixPos(:,:,2)));

output = zeros(xMax-xMin+1,yMax-yMin+1,3); %creates a matrix to output the final image to.
outputWidth = size(output,1);
outputHeight = size(output,2);

c{outputWidth,outputHeight,2,3} = []; %value 3 is the depth it is set at 2 so that matlab doesn't collapse this dimension
for i = 1:width %Cell arrays used to find and resolve overlayed pixels. Fills Cell were depth marks overlaying pixels.
    for j = 1:height
        count = 1;
        while true
            if count + 1 > size(c,3) %increases the depth of the cell array if count greater than its depth
                c{i,j,count+1,3} = [];
            end
            %assigns colours to the transformed location at a increase
            %depth if the target pixel is already filled.
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

for i = 1:outputWidth % average overlayed pixels as they are found in the cell matrix
    for j = 1:outputHeight %loop thought the each pixel in the cell matrix. when a non empty
        count = 1;
        tempr = uint16(0);
        tempg = uint16(0);
        tempb = uint16(0);
        while ~isempty(c{i,j,count,1}) %loops thought the depth of the pixel to average the colour.
            tempr = tempr + uint16(c{i,j,count,1});
            tempg = tempg + uint16(c{i,j,count,2});
            tempb = tempb + uint16(c{i,j,count,3});
            count = count + 1;
        end
        if count > 1 %indentified if a hole is present. If count is 0 there where no pixels assign by the transformation. to that point in the output

           output(i,j,1) = tempr/(count-1);
           output(i,j,2) = tempg/(count-1);
           output(i,j,3) = tempb/(count-1);
        else
           output(i,j,1) = -1;
           output(i,j,2) = -1; 
           output(i,j,3) = -1; 
        end
    end
end

for i = 1:outputWidth    %1-nearest neighbour implementation
    for j = 1:outputHeight
        if output(i,j) == -1
            temp = ICV_find_1NN_colour(ICV_inverse_3x3(skewMat)*[i-1+xMin;j-1+yMin;1], imgin); % I forgot to move the corner of the image back to the orgin from 1,1 so my hole filling kept failing.
            output(i,j,1) = temp(1);
            output(i,j,2) = temp(2);
            output(i,j,3) = temp(3);
        end
    end
end

output = ICV_trim(output); %trims the extended black portion of the image.

imgout = output;