file = fullfile('Datasets','DatasetA','car-1.jpg');
img = imread(file);
img = ICV_togrey(img);

boxkernel = [1,1,1;1,1,1;1,1,1];
kernelA = [1,2,1;2,4,2;1,2,1];
matConstA = 16;
kernelB = [0,1,0;1,-4,1;0,1,0];
kernelA5x5 = [1,4,6,4,1;4,16,24,16,4;6,24,36,24,6;4,16,24,16,4;1,4,6,4,1];
matConstA5x5 = 256;
kernelB5x5 = [0,0,1,0,0;0,0,1,0,0;1,1,-8,1,1;0,0,1,0,0;0,0,1,0,0];
kernelA7x7 = [1,4,8,10,8,4,1;4,16,24,30,24,16,4;8,24,36,50,36,24,8;10,30,50,80,50,30,10;8,24,36,50,36,24,8;4,16,24,30,24,16,4;1,4,8,10,8,4,1];
matConstA7x7 = 940;
kernelB7x7 = [0,0,0,1,0,0,0;0,0,0,1,0,0,0;0,0,0,1,0,0,0;1,1,1,-12,1,1,1;0,0,0,1,0,0,0;0,0,0,1,0,0,0;0,0,0,1,0,0,0];

%{
disp(boxkernel);
disp(kernelA);
disp(kernelB);
disp(kernelA5x5);
disp(kernelB5x5);
disp(kernelA7x7);
disp(kernelB7x7);
%}

output = ICV_padarry(img,1,1);
output = ICV_convolve(output, boxkernel, 9);
imwrite(uint8(output), '3x3Average.jpg');

output = ICV_padarry(img,1,1);
output = ICV_convolve(output, kernelA, matConstA);
imwrite(uint8(output), 'kernalA3x3.jpg');

output = ICV_padarry(img,1,1);
output = ICV_convolve(output, kernelB, 1);
imwrite(uint8(output), 'kernalB3x3.jpg');

output = ICV_padarry(img,1,1);
output = ICV_convolve(output, kernelA, matConstA);
output = ICV_padarry(output,1,1);
output = ICV_convolve(output, kernelA, matConstA);
imwrite(uint8(output), 'kernelAkernalA3x3.jpg');

output = ICV_padarry(img,1,1);
output = ICV_convolve(output, kernelA, matConstA);
output = ICV_padarry(output,1,1);
output = ICV_convolve(output, kernelB, 1);
imwrite(uint8(output), 'kernelAkernelB3x3.jpg');

output = ICV_padarry(img,1,1);
output = ICV_convolve(output, kernelB, 1);
output = ICV_padarry(output,1,1);
output = ICV_convolve(output, kernelA, matConstA);
imwrite(uint8(output), 'kernelBkernelA3x3.jpg');

output = ICV_padarry(img,2,1);
output = ICV_convolve(output, kernelA5x5, matConstA5x5);
output = ICV_padarry(output,2,1);
output = ICV_convolve(output, kernelA5x5, matConstA5x5);
imwrite(uint8(output), 'kernelAkernelA5x5.jpg');

output = ICV_padarry(img,2,1);
output = ICV_convolve(output, kernelA5x5, matConstA5x5);
output = ICV_padarry(output,2,1);
output = ICV_convolve(output, kernelB5x5, 1);
imwrite(uint8(output), 'kernelAkernelB5x5.jpg');

output = ICV_padarry(img,2,1);
output = ICV_convolve(output, kernelB5x5, 1);
output = ICV_padarry(output,2,1);
output = ICV_convolve(output, kernelA5x5, matConstA5x5);
imwrite(uint8(output), 'kernelBkernelA5x5.jpg');

output = ICV_padarry(img,3,1);
output = ICV_convolve(output, kernelA7x7, matConstA7x7);
output = ICV_padarry(output,3,1);
output = ICV_convolve(output, kernelA7x7, matConstA7x7);
imwrite(uint8(output), 'kernelAkernelA7x7.jpg');

output = ICV_padarry(img,3,1);
output = ICV_convolve(output, kernelA7x7, matConstA7x7);
output = ICV_padarry(output,3,1);
output = ICV_convolve(output, kernelB7x7, 1);
imwrite(uint8(output), 'kernelAkernelB7x7.jpg');

output = ICV_padarry(img,3,1);
output = ICV_convolve(output, kernelB7x7, 1);
output = ICV_padarry(output,3,1);
output = ICV_convolve(output, kernelA7x7, matConstA7x7);
imwrite(uint8(output), 'kernelBkernelA7x7.jpg');

