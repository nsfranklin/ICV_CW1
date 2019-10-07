function imgout = ICV_rotate(imgin, angle) %angle will always be degress so will use cosd() and sind()

width = size(imgin, 1);
height = size(imgin, 2);

rotationMat = [cosd(angle),sind(angle),0;-sind(angle),cosd(angle),0;0,0,1];
transToOriMat = [1,0,0;0,1,0;-width/2,-height/2,1];
transFromOriMat = [1,0,0;0,1,0;width/2,height/2,1];
combindMat = transToOriMat*rotationMat*transFromOriMat;

transPixPos = zeros(width,height,2); %Temp storage of transformed values

for x = 0:width-1
    for y = 0:height-1
       temp = combindMat*[x;y;1]; 
       transPixPos(x+1,y+1,1) = temp(1);
       transPixPos(x+1,y+1,2) = temp(2);
    end
end

%disp(transPixPos);

for i = 1:width
    for j = 1:height
       transPixPos(i,j,1) = round(transPixPos(i,j,1));
       transPixPos(i,j,2) = round(transPixPos(i,j,2));
    end
end
xMax = max(max(transPixPos(:,:,1)));
yMax = max(max(transPixPos(:,:,2)));
xMin = min(min(transPixPos(:,:,1)));
yMin = min(min(transPixPos(:,:,2)));

disp(transPixPos);

output = ones(xMax-xMin+1,yMax-yMin+1,3);
output = output*-1;
outputWidth = size(output,1);
outputHeight = size(output,2);

for k = 1:width
    for l = 1:height
        output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,1) = imgin(k,l,1);
        output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,2) = imgin(k,l,2); 
        output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,3) = imgin(k,l,3); 
    end
end

for i = 1:outputWidth
    for j = 1:outputHeight
        if output(i,j) == -1;
            temp = 0;
            count = 0;
            if 
            temp = output    
            count = count + 1;
            end
            if
                
            count = count + 1;
            end
            if
                
            count = count + 1;
            end
            if
                
            count = count + 1;
            end
            if count > 1;
                output(i,j) = round(temp/3);
            else
                output(i,j) = 0;
            end
        end
    end
end
imgout = output;

%stage 4 interpolate unfilled pixels
