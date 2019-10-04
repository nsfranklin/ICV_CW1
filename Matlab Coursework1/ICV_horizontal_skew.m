function imgout = ICV_horizontal_skew(imgin, angle)


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
%disp(transPixPos);
xMax = max(max(transPixPos(:,:,1)));
yMax = max(max(transPixPos(:,:,2)));
xMin = min(min(transPixPos(:,:,1)));
yMin = min(min(transPixPos(:,:,2)));
output = zeros(xMax-xMin+1,yMax-yMin+1,3);
for k = 1:width
    for l = 1:height
        output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,1) = imgin(k,l,1);
        output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,2) = imgin(k,l,2); 
        output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,3) = imgin(k,l,3); 
    end
end
imgout = output;