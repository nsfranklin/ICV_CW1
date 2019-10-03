file = fullfile('Datasets','DatasetB.avi');
vidObj = VideoReader(file); % Create the Video reader object
vidFrames = read(vidObj); %reading video frames into Mat

histo = cell(size(vidFrames,4));

for x = 1:size(vidFrames,4)
    temp = ICV_calc_colour_histogram(vidFrames(:,:,:,x));
    disp(temp);
    histo{x} = temp;
    disp(x);
end

