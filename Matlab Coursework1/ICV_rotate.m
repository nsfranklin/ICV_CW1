function imgout = ICV_rotate(imgin, angle) %angle will always be degress so will use cosd() and sind()

width = size(imgin, 1); %finds image width and height for future use
height = size(imgin, 2);

rotationMat = [cosd(angle),sind(angle),0;-sind(angle),cosd(angle),0;0,0,1]; %defines the rotation matrix
transToOriMat = [1,0,0;0,1,0;-width/2,-height/2,1]; %defines translation to and from centre
transFromOriMat = [1,0,0;0,1,0;width/2,height/2,1];
combindMat = transToOriMat*rotationMat*transFromOriMat; % Creates combind matrix transformation

transPixPos = zeros(width,height,2); %Mat of new positions indexed by old positions

for x = 1:width %finds the transformed postions
    for y = 1:height
       temp = combindMat*[x;y;1]; 
       transPixPos(x+1,y+1,1) = round(temp(1)); 
       transPixPos(x+1,y+1,2) = round(temp(2));
    end
end

xMax = max(max(transPixPos(:,:,1)));
yMax = max(max(transPixPos(:,:,2)));
xMin = min(min(transPixPos(:,:,1)));
yMin = min(min(transPixPos(:,:,2)));

output = ones(xMax-xMin+1,yMax-yMin+1,3);
output = output*-1;
outputWidth = size(output,1);
outputHeight = size(output,2);

c = cell(outputWidth,outputHeight,3,1);
for i = 1:width %Cell arrays used to find and resolve overlayed pixels. Fills Cell were depth marks overlaying pixels.
    for j = 1:height
        disp(i);
        disp(j);
        if isempty(c{transPixPos(i,j,1)-xMin,transPixPos(i,j,2)-yMin,1}) 
            c{transPixPos(i,j,1)+1-xMin,transPixPos(i,j,2)+1-yMin,1,1} = imgin(i,j,1);
            c{transPixPos(i,j,1)+1-xMin,transPixPos(i,j,2)+1-yMin,1,2} = imgin(i,j,2);
            c{transPixPos(i,j,1)+1-xMin,transPixPos(i,j,2)+1-yMin,1,3} = imgin(i,j,3);
        else 
            count = 2;
            while true 
                if isempty(c{transPixPos(i,j,1)-xMin,transPixPos(i,j,2)-yMin,count})
                    c{transPixPos(i,j,1)-xMin,transPixPos(i,j,2)-yMin,count,1} = imgin(i,j,1);
                    c{transPixPos(i,j,1)-xMin,transPixPos(i,j,2)-yMin,count,2} = imgin(i,j,2);
                    c{transPixPos(i,j,1)-xMin,transPixPos(i,j,2)-yMin,count,3} = imgin(i,j,3);
                    break;
                end
                count = count + 1;
            end
        end
    end
end

for i = 1:outputWidth
    for j = 1:outputHeight
        count = 0;
        tempr = 0;
        tempg = 0;
        tempb = 0;
        while ~isempty(c{i,j,count+1})
            tempr = tempr + c{i,j,count+1,1};
            tempg = tempg + c{i,j,count+1,2};
            tempb = tempb + c{i,j,count+1,3};
            count = count + 1;
        end
        if count ~= 0
           output(i,j,1) = round(tempr/count);
           output(i,j,2) = round(tempg/count);
           output(i,j,3) = round(tempb/count);
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
            temp = ICV_find_1NN_colour(ICV_inverse_3x3(combindMat)*[i+xMin;j+yMin;1], imgin);
            output(i,j,1) = temp(1);
            output(i,j,2) = temp(2);
            output(i,j,3) = temp(3);
        end
    end
end

imgout = round(output);

