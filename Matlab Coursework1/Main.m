file = fullfile('Datasets','DatasetA','face-1.jpg');
img = imread(file);

output = ICV_rotate(img, 30);
imwrite(output, 'rotate30.jpg');

output = ICV_rotate(img, 60);
imwrite(output, 'rotate60.jpg');

output = ICV_rotate(img, 120);
imwrite(output, 'rotate120.jpg');

output = ICV_rotate(img, -50);
imwrite(output, 'rotate-50.jpg');

output = ICV_skew(img, 10);
imwrite(output, 'skew10.jpg');

output = ICV_skew(img, 40);
imwrite(output, 'skew40.jpg');

output = ICV_skew(img, 60);
imwrite(output, 'skew60.jpg');

