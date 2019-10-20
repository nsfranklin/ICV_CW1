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

plot(temp100,'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame100.jpg');

plot(temp200,'DisplayName','temp200');
xlim([1,256]);
saveas(gcf, 'HistogramFrame200.jpg');

intersection88and166 = ICV_histogram_intersection(histo{88},histo{166});
plot(intersection88and166,'DisplayName','IntersectionFrame88and166');
xlim([1,256]);
saveas(gcf, 'IntersectionFrame88and166.jpg');

intersection88and166 = ICV_histogram_intersection(histo{88},histo{166}); %the intersection of frame 88 and 166
plot(intersection88and166,'DisplayName','IntersectionFrame88and166');
xlim([1,256]);
saveas(gcf, 'IntersectionFrame88and166.jpg');

intersection240and6 = ICV_histogram_intersection(histo{240},histo{6});
plot(intersection240and6,'DisplayName','IntersectionFrame240and6');
xlim([1,256]);
saveas(gcf, 'IntersectionFrame240and6.jpg');

plot(histo{88},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame88.jpg');

plot(histo{166},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame166.jpg');

plot(histo{240},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame240.jpg');

plot(histo{6},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame6.jpg');



