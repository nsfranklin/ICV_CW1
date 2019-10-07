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

%disp(transPixPos);

output = ones(xMax-xMin+1,yMax-yMin+1,3);
output = output*-1;
outputWidth = size(output,1);
outputHeight = size(output,2);


c = cell(outputWidth,outputHeight,3,1);
for i = 1:width %Cell arrays used to find and resolve overlayed pixels.
    for j = 1:height
        if isempty(c{i,j,1}) 
            c{i,j,1,1} = imgin(i,j,1);
            c{i,j,1,2} = imgin(i,j,2);
            c{i,j,1,3} = imgin(i,j,3);
        else 
           count = 1;
            while ~isempty(c{i,j,count})
                    
            end
        end
    end
end

for k = 1:width
    for l = 1:height
        if output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,1) == -1
            output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,1) = imgin(k,l,1);
            output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,2) = imgin(k,l,2); 
            output(transPixPos(k,l,1)+1-xMin,transPixPos(k,l,2)+1-yMin,3) = imgin(k,l,3);
        end
        %working on resolving overlayed pixels.
    end
end

copyOutput = output;



for i = 1:outputWidth
    for j = 1:outputHeight
        %disp(i);
        %disp(j);
        if output(i,j) == -1
            temp = 0;
            count = 0;
            if i ~= 1 && i ~= outputWidth && copyOutput(i-1,j) ~= -1
            temp = temp + copyOutput(i-1,j);
            count = count + 1;
            end
            if i ~= 1 && i ~= outputWidth && copyOutput(i+1,j) ~= -1
            temp = temp + copyOutput(i+1,j);
            count = count + 1;
            end
            if j ~= 1 && j ~= outputHeight && copyOutput(i,j-1) ~= -1
            temp = temp + copyOutput(i,j-1);
            count = count + 1;
            end
            if j ~= 1 && j ~= outputHeight && copyOutput(i,j+1) ~= -1
            temp = temp + copyOutput(i,j+1);  
            count = count + 1;
            end
            if count > 0
                if temp/count > 50 && temp/count < 255
                    %disp(round(temp/count));
                end
                output(i,j,1) = round(temp/count);
                output(i,j,2) = round(temp/count);
                output(i,j,3) = round(temp/count);
            else
                output(i,j,1) = 0;
                output(i,j,2) = 0;
                output(i,j,3) = 0;
            end
        end
    end
end

imgout = output;

