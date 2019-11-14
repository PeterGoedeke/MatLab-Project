function [r, g, b] = MostDistantPixel(points)
%MOSTDISTANTPIXEL Finds pixel furthest from median from list of pixels
%   Inputs: list of r,g,b pixels
%   Outputs: r,g,b of pixel which is the furthest from the median
%
%   Calculates the median r,g,b values from the list of pixels provided.
%   All pixels within the list are then compared to the median r,g,b values
%   using squared Euclidean distance. The pixel which is furthest from the
%   median is returned.

points = double(points);
% Get median pixel values
[mr, mg, mb] = MedianPixel(points);
% Calculate the distances between each pixel and the median in one sweep
distances = (points(:,:,1) - mr).^2 + (points(:,:,2) - mg).^2 + (points(:,:,3) - mb).^2;
% Find the index of the maximum value
[~, index] = max(distances);
% Create a cell array with the r, g, b values of the maximum value. This is
% done because it is the easiest and most expandable way to distribute the
% three values into three separate values
pointsCell = num2cell(points(1,index,:));
[r, g, b] = pointsCell{:};
end

% Link explaining how to destructure an array. Unfortunately, the above way
% seems like the best way to do it:
% https://stackoverflow.com/questions/2893356/matlab-easiest-way-to-assign-elements-of-a-vector-to-individual-variables