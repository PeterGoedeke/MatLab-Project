function filteredImage = RemoveAction(imagesCells)
%REMOVEACTION Removes actions (differences) between a set of images
%   Inputs: 1xn cell array containing images to be analysed.
%   Outputs: rxcx3 image with differences removed
%
%   Remove Action compares a set of images and removes instances in which
%   one image contains image data which is not shared between the rest of
%   the image. This is done by returning the pixel with the median colour
%   values when compared to corresponding pixels from the other images
%   supplied. As the median pixel value will never correspond to the image
%   which differs from the others, this removes differences.

% imagesCells is a cell array filled with images. This is difficult to work
% with, so it is converted into a 4d array, in which the 4th dimension
% represents the image
images = cat(4,imagesCells{:});
% Because the 4th dimension represents the image layer, it is possible to
% take the median of every pixel location across all images instantaneously
% by taking the median across the 4th dimension. Rounding is unnecessary,
% as the uint8 file format automatically rounds.
filteredImage = median(images, 4);

end