function [mr, mg, mb] = MedianPixel(pixels)
%MEDIANPIXEL Calculates the median r,g,b values from a list of pixels
%   Inputs: List of r,g,b pixels.
%   Outputs: Median r,g,b values
pixels = double(pixels);
% Find the median r, g, b value from the given list of pixels
mr = round(median(pixels(:,:,1)));
mg = round(median(pixels(:,:,2)));
mb = round(median(pixels(:,:,3)));
end

