file = fullfile('Datasets','DatasetB.avi');
vidObj = VideoReader(file); % Create the Video reader object
vidFrames = read(vidObj); %reading video frames into Mat

histo = cell(size(vidFrames,4));
for x = 1:size(vidFrames,4)-1
    %disp(x);
    %disp(vidFrames(:,:,:,10));
    temp = ICV_calc_colour_histogram(vidFrames(:,:,:,x),x);
    if x == 100
        imwrite(vidFrames(:,:,:,100),'frame100.jpg');
        temp100 = temp;
    end
    if x == 200
        imwrite(vidFrames(:,:,:,200),'frame200.jpg');
        temp200 = temp;
    end
    histo{x} = temp;
end

%Question 3a
plot(temp100,'DisplayName','temp100'); %histogram of Frame 100
xlim([1,256]);
saveas(gcf, 'HistogramFrame100.jpg');

plot(temp200,'DisplayName','temp200'); %histogram of Frame 200
xlim([1,256]);
saveas(gcf, 'HistogramFrame200.jpg');


%Question 3b
[intersection88and89, percentage] = ICV_histogram_intersection(histo{88},histo{89}); %the intersection histogram of frame 88 and 89
plot(intersection88and89,'DisplayName','IntersectionFrame88and89');
xlim([1,256]);
imwrite(vidFrames(:,:,:,88),'frame88.jpg');
imwrite(vidFrames(:,:,:,89),'frame89.jpg');
saveas(gcf, 'IntersectionFrame88and89.jpg');
disp("Percentage intersection between 88 and 89");
disp(percentage);

[intersection6and7, percentage] = ICV_histogram_intersection(histo{6},histo{7}); %the intersection histogram of frame 89 and 90
plot(intersection6and7,'DisplayName','IntersectionFrame6and7'); %modify to show the 
xlim([1,256]);
imwrite(vidFrames(:,:,:,6),'frame6.jpg');
imwrite(vidFrames(:,:,:,7),'frame7.jpg');
saveas(gcf, 'IntersectionFrame6and7.jpg');
disp("Percentage intersection between 6 and 7");
disp(percentage);

plot(histo{88},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame88.jpg');

plot(histo{89},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame89.jpg');

plot(histo{6},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame6.jpg');

plot(histo{7},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame7.jpg');



