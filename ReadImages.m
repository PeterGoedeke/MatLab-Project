function images = ReadImages(directoryName, fileNames)
%READIMAGES Reads image data from list of images
%   Inputs: name of the directory to read the images from and the file
%   names of the images to be read within the directory.
%   Outputs: 1 dimensional cell array containing uint8 images

% Preallocates cell array of correct length
images = cell(1, length(fileNames));
% Reads image from the directory for each name in the list
for i = 1:length(fileNames)
    images{i} = imread([directoryName '\' fileNames{i}]);
end

end

