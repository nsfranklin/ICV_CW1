file = fullfile('Datasets','DatasetA','car-1.jpg');
img = imread(file);

output = ICV_convolve(img, ones(3,3), 9);