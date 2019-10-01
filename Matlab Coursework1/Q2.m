file = fullfile('Datasets','DatasetA','car-1.jpg');
img = imread(file);

boxkernel = [1,1,1;1,1,1;1,1,1];
kernelA = [1,2,1;2,4,2;1,2,2];
kernelB = [0,1,0;1,-4,1;0,1,0];
kernelA5x5 = [1,4,6,4,1; ; ; ; ];
kernelB5x5 = zeros(3,3);
kernelA7x7 = zeros(3,3);
kernelB7x7 = zeros(3,3);

output = ICV_padarry(img,2,1);
output = ICV_convolve(output, boxkernel, 9);
imwrite(output, '3x3Average.jpg');

output = ICV_padarry(img,2,1);
output = ICV_convolve(output, kernelA, 1);
imwrite(output, 'kernalA3x3.jpg');

output = ICV_padarry(img,2,1);
output = ICV_convolve(output, kernelB, 1);
imwrite(output, 'kernalB3x3.jpg');

output = ICV_padarry(img,2,1);
output = ICV_convolve(output, kernelA, 1);
output = ICV_convolve(output, kernelA, 1);
imwrite(output, 'kernelAkernalA3x3.jpg');

output = ICV_padarry(img,2,1);
output = ICV_convolve(output, kernelA, 1);
output = ICV_convolve(output, kernelB, 1);
imwrite(output, 'kernelAkernelB3x3.jpg');

output = ICV_padarry(img,2,1);
output = ICV_convolve(output, kernelB, 1);
output = ICV_convolve(output, kernelA, 1);
imwrite(output, 'kernelBkernelA3x3.jpg');

output = ICV_padarry(img,3,1);
output = ICV_convolve(output, kernelA5x5, 1);
output = ICV_convolve(output, kernelA5x5, 1);
imwrite(output, 'kernelAkernelA5x5.jpg');

output = ICV_padarry(img,3,1);
output = ICV_convolve(output, kernelA5x5, 1);
output = ICV_convolve(output, kernelB5x5, 1);
imwrite(output, 'kernelAkernelB5x5.jpg');

output = ICV_padarry(img,3,1);
output = ICV_convolve(output, kernelB5x5, 1);
output = ICV_convolve(output, kernelA5x5, 1);
imwrite(output, 'kernelBkernelA5x5.jpg');

output = ICV_padarry(img,4,1);
output = ICV_convolve(output, kernelA7x7, 1);
output = ICV_convolve(output, kernelA7x7, 1);
imwrite(output, 'kernelAkernelA7x7.jpg');

output = ICV_padarry(img,4,1);
output = ICV_convolve(output, kernelA7x7, 1);
output = ICV_convolve(output, kernelB7x7, 1);
imwrite(output, 'kernelAkernelB7x7.jpg');

output = ICV_padarry(img,4,1);
output = ICV_convolve(output, kernelB7x7, 1);
output = ICV_convolve(output, kernelA7x7, 1);
imwrite(output, 'kernelBkernelA7x7.jpg');

