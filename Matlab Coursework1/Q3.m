file = fullfile('Datasets','DatasetB.avi');
vidObj = VideoReader(file); % Create the Video reader object
vidFrames = read(vidObj); %reading video frames into Mat

histo = cell(size(vidFrames,4));
for x = 1:size(vidFrames,4)-1
    disp(x);
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
    %histo{x} = temp;
end

plot(temp100,'DisplayName','temp100');
xlim([0,255]);
saveas(gcf, 'HistogramFrame100.jpg');

plot(temp200,'DisplayName','temp200');
xlim([0,255]);
saveas(gcf, 'HistogramFrame200.jpg');

ICV_histogram_intersection();




