function colourValues = MostDistantPixel2(points)
%MOSTDISTANTPIXEL Summary of this function goes here
%   Detailed explanation goes here

medians = median(points, 4);




% [mr, mg, mb] = MedianPixel(points);
% distances = zeros(1, length(points));
% 
% for i = 1:length(distances)
%     distances(i) = PixelDistance([mr mg mb], points(1,i,:));
% end
% [~, index] = max(distances);
% 
% pointsCell = num2cell(points(1,index,:));
% [r, g, b] = pointsCell{:}; % maybe this could be sped up by making it three lines?
% colourValues = [r g b];

end

