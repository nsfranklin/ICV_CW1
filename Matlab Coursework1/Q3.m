file = fullfile('Datasets','DatasetB.avi');
vidObj = VideoReader(file); % Create the Video reader object
vidFrames = read(vidObj); %reading video frames into Mat

histo = ICV_calc_colour_histogram(vidFrames(:,:,:,1));

disp(histo);


