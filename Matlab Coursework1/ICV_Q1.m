%Question one main script

%loads the name image
file = fullfile('Datasets','name.png');
img = imread(file);

%Cals and Saves 30 degree rotation
output = uint8(ICV_rotate(img, 30));
imwrite(output, 'rotate30.png');
disp("rotate30");

%Cals and Saves 60 degree rotation
output = uint8(ICV_rotate(img, 60));
imwrite(output, 'rotate60.png');
disp("rotate60");

%Cals and Saves 120 degree rotation
output = uint8(ICV_rotate(img, 120));
imwrite(output, 'rotate120.png');
disp("rotate120");

%Cals and Saves -50 degree rotation
output = uint8(ICV_rotate(img, -50));
imwrite(output, 'rotate-50.png');
disp("rotate-50");

%Cals and Saves 10 degree horizontal skew
output = uint8(ICV_horizontal_skew(img, 10));
imwrite(output, 'skew10.png');
disp("skew10");

%Cals and Saves 40 degree horizontal skew
output = uint8(ICV_horizontal_skew(img, 40));
imwrite(output, 'skew40.png');
disp("skew40");

%Cals and Saves 60 degree horizontal skew
output = uint8(ICV_horizontal_skew(img, 60));
imwrite(output, 'skew60.png');
disp("skew60");

%Cals and Saves 20 degree rotation then 50 degree skew
output = uint8(ICV_horizontal_skew(ICV_rotate(img, 20),50));
imwrite(output, 'rotate20skew50.png');
disp("rotations20skew50");

%Cals and Saves 50 degree skew then 20 degree rotation.
output = uint8(ICV_rotate(ICV_horizontal_skew(img,50),20));
imwrite(output, 'skew50rotate20.png');
disp("skew50rotate20");




