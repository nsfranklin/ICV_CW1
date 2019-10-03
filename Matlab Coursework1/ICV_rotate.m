function imgout = ICV_rotate(imgin, angle) %angle will always be degress so will use cosd() and sind()

rotationMat = [,,;,,;0,0,1];
transToOriMat = [,,;,,;0,0,1];
transFromOriMat = [,,;,,;0,0,1];

%stage one apply the rotation to find there ideal location

%stage two apply the round the rotation of each ideal location

%state 3 resolve conflicting pixels

%stage 4 interpolate unfilled pixels



imgout = zeros(3,3);