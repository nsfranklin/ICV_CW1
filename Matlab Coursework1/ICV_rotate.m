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

output = zeros(xMax-xMin+1,yMax-yMin+1,3);

duplicateValue = ICV_find_overlayed

for k = 1:width
    for l = 1:height
        output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,1) = imgin(k,l,1);
        output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,2) = imgin(k,l,2); 
        output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,3) = imgin(k,l,3); 
    end
end

imgout = output;




%state 3 resolve conflicting pixels

%stage 4 interpolate unfilled pixels
