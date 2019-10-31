file = fullfile('Datasets','DatasetB.avi');
vidObj = VideoReader(file); % Create the Video reader object
vidFrames = read(vidObj); %reading video frames into Mat

histo = cell(size(vidFrames,4));
for x = 1:size(vidFrames,4)
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
rintersect = intersection88and89(1:256,1);
gintersect = intersection88and89(1:256,2);
bintersect = intersection88and89(1:256,3);

area(rintersect,'DisplayName','IntersectionFrame88and89');
hold on
area(gintersect,'DisplayName','IntersectionFrame88and89');
area(bintersect,'DisplayName','IntersectionFrame88and89');
plot(histo{88},'DisplayName','temp100');
plot(histo{89},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'IntersectionFrame88and89.jpg');
disp("Percentage intersection between 88 and 89");
disp(percentage);
hold off


[intersection9and10, percentage] = ICV_histogram_intersection(histo{9},histo{10}); %the intersection histogram of frame 89 and 90
rintersect = intersection9and10(1:256,1);
gintersect = intersection9and10(1:256,2);
bintersect = intersection9and10(1:256,3);

area(rintersect,'DisplayName','IntersectionFrame9and10'); %modify to show the the areas of the intersection with the other frame intersections overlayed
hold on
area(gintersect,'DisplayName','IntersectionFrame9and10');
area(bintersect,'DisplayName','IntersectionFrame9and10');
plot(histo{9},'DisplayName','temp100');
plot(histo{10},'DisplayName','temp100');
xlim([1,256]);
ylim([0,4500]);
saveas(gcf, 'IntersectionFrame9and10.jpg');
disp("Percentage intersection between 9 and 10");
disp(percentage);
hold off

plot(histo{88},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame88.jpg');

plot(histo{89},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame89.jpg');

plot(histo{9},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame9.jpg');

plot(histo{10},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame10.jpg');

