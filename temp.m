function img = temp(images)
%REMOVEACTION Summary of this function goes here
%   Detailed explanation goes here
[x, y, z] = size(images{1, 1});
img = reshape([images{:}], [x, y, length(images), z]);
img = squeeze(median(img, 3));
end