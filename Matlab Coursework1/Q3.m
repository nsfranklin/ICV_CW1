file = fullfile('Datasets','DatasetB.avi');
vidObj = VideoReader(file); % Create the Video reader object
vidFrames = read(vidObj); %reading video frames into Mat




