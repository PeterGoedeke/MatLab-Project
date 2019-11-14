function distance = PixelDistance(point1, point2)
%PIXELDISTANCE Calculates the squared distance between two pixels
%   Inputs: two r,g,b pixels
%   Outputs: the squared distance between these two pixels within colour
%   space
%
%   Distance is calculated by treating the r, g, and b values as spatial
%   dimensions and applying pythagorus to them. The result is left squared,
%   as opposed to being square rooted, as this decreases function runtime.
%   Because this function is designed only to produce results for
%   comparison, it does not matter that the result is unsquared. For
%   standard Euclidean distance between two points, see pdist.

if ~isa(point1, 'double')
    point1 = double(point1);
end
if ~isa(point2, 'double')
    point2 = double(point2);
end
% Calculate the squared distance between point1 and point2 using pythagorus
distance = (point1(1)-point2(1))^2 + (point1(2)-point2(2))^2 + (point1(3)-point2(3))^2;

end

