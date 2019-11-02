%file = fullfile('Datasets','DatasetA','car-1.jpg');
file = fullfile('Datasets','name.png');
img = imread(file);
%img = rand(7,7,3);

%{
output = ICV_rotate(img, 30);
imwrite(output, 'rotate30.png');
imshow('rotate30.png');

output = ICV_rotate(img, 60);
imwrite(output, 'rotate60.png');
imshow('rotate60.png');

output = ICV_rotate(img, 120);
imwrite(output, 'rotate120.png');
imshow('rotate120.png');

output = ICV_rotate(img, -50);
imwrite(output, 'rotate-50.png');
imshow('rotate-50.png');


output = ICV_horizontal_skew(img, 10);
imwrite(output, 'skew10.png');
imshow('skew10.png');

output = ICV_horizontal_skew(img, 40);
imwrite(output, 'skew40.png');
imshow('skew40.png');

output = ICV_horizontal_skew(img, 60);
imwrite(output, 'skew60.png');
imshow('skew60.png');


%}
output = ICV_horizontal_skew(ICV_rotate(img, 20),50);
imwrite(output, 'rotate20skew50.png');
imshow('rotate20skew50.png');

output = ICV_rotate(ICV_horizontal_skew(img,50),20);
imwrite(output, 'skew50rotate20.png');
imshow('skew50rotate20.png');





