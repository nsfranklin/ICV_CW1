file = fullfile('Datasets','DatasetB.avi');
vidObj = VideoReader(file); % Create the Video reader object
vidFrames = read(vidObj); %reading video frames into Mat

%finds the histogram for every frame a puts them into a cell array index by
%the frame number.
histo = cell(size(vidFrames,4));
for x = 1:size(vidFrames,4)
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
%the intersection histogram of frame 88 and 89
[intersection88and89, percentage] = ICV_histogram_intersection(histo{88},histo{89}); %the intersection histogram of frame 88 and 89
rintersect = intersection88and89(1:256,1);
gintersect = intersection88and89(1:256,2);
bintersect = intersection88and89(1:256,3);

%splitting out the colour channels improved the visualisation.
area(rintersect,'DisplayName','IntersectionFrame88and89'); %the intersection of red values
hold on % hold to allow for an overlayed visualiation of the intersection.
area(gintersect,'DisplayName','IntersectionFrame88and89'); %the intersection of green values
area(bintersect,'DisplayName','IntersectionFrame88and89');%the intersection of blue values
plot(histo{88},'DisplayName','temp100'); %plot of the frame 88 histogram
plot(histo{89},'DisplayName','temp100'); %plot of the frame 99 histogram
xlim([1,256]); %setting the limit to the pixel values minium and maxium pixel value of set by one
saveas(gcf, 'IntersectionFrame88and89.jpg'); %saves the visulisation of the intersection  of 88 and 89
disp("Percentage intersection between 88 and 89");
disp(percentage);
hold off

%the intersection histogram of frame 9 and 10
[intersection9and10, percentage] = ICV_histogram_intersection(histo{9},histo{10}); %the intersection histogram of frame 9 and 10
rintersect = intersection9and10(1:256,1);
gintersect = intersection9and10(1:256,2);
bintersect = intersection9and10(1:256,3);

%Visulisation of the intersection of frame 9 and 10
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

%saving histogram of frame 88
plot(histo{88},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame88.jpg');

%saving histogram of frame 89
plot(histo{89},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame89.jpg');

%saving histogram of frame 9
plot(histo{9},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame9.jpg');

%saving histogram of frame 10
plot(histo{10},'DisplayName','temp100');
xlim([1,256]);
saveas(gcf, 'HistogramFrame10.jpg');

