function filteredImage = ActionShot(imagesCells)
%ACTIONSHOT Create an Action Shot from a series of images
%   Inputs: a singular, one dimensional cell array containing 3 dimensional
%   uint8 images.
%   Outputs: a singular three dimensional uint8 image
%
%   Creates an action shot from the images provided. This is undertaken by
%   finding the median pixel in each location across all the provided
%   images, comparing all pixels to their corresponding median pixel, and
%   finally selecting the pixel which is, relative to other corresponding
%   pixels, the greatest distance away from its corresponding median pixel.

% imagesCells is a cell array filled with images. This is difficult to work
% with, so it is converted into a 4d array, in which the 4th dimension
% represents the image. Additionally, it is converted to double format, as
% this allows use of the large numbers required for
% the calculation of distances
images = double(cat(4,imagesCells{:}));

% creates a 3d array filled with the median pixel for each pixel
medians = median(images, 4);

% subtracts the 3d medians array from the 4d images array. Because the
% arrays have the same sizes for the first three dimensions, this results
% in the rgb values of each median pixel being subtracted from the rgb
% values of all corresponding pixels in every image. These differences are
% then squared to complete pythagorus, before they are summed across the
% 3rd dimension (completing pythagorus)
distancesFromMedians = sum((images - medians).^2, 3);

% find the indices of the furthest pixel from the median in every pixel
% location. returns a 2d array
[~, indicesOfFurthestPixels] = max(distancesFromMedians,[],4);

[m,n,p,q] = size(images);
% Creates three three dimensional arrays for retrieving linear indices from
% 4d iamges array. The necessity for this is explained below.
[I,J,K] = ndgrid(1:m,1:n, 1:p);
% Replicates the matrix containing the 4d depths of the desired pixels over
% the 3rd dimension to create a 3 dimensional array. The necessity for this
% is explained below.
fourDDepthIndices = repmat(indicesOfFurthestPixels,[1,1,3]);
% Generates the required linear indices needed to retrieve only the
% furthest-from-median pixels and flatten the 4d images array into a 3d
% array.
%
% Because this is so difficult to visualise in 4 dimensions, this
% explanation will explain 3 dimensional sub2ind usage. The first argument
% to sub2ind is the size of the overall array. This is needed to select the
% desired linear indices.
%
% The following arguments are the indices at which the desired elements
% within the array exist. In the case of a 3 dimensional array, the first
% of these arguments would be the rows desired, the second would be the
% columns, and the third would be the 'layer'.
%
% These pair up. For example, if the arguments were [1 3], [1 3], [1 3],
% the linear indices for the points (1,1,1) and (3,3,3) would be returned.
%
% For higher dimensional arrays, it makes sense to input these arguments as
% matrices or even higher dimensional arrays, rather than vectors. For
% example, when finding the linear indices of an nxmxp 3d array, it makes
% sense for the first two arguments after the size argument to be nxm and
% nxp matrices, as this will 'pair up', resulting in linear indices for all
% of the rows and columns of the 3d array.
%
% The final argument, in the example of a 3d array, is for the depth. If
% this is given as a 2 dimensional array containing 'depths' to index at,
% one will realise that, after pairing up the three indexing matrices,
% sub2ind will produce a 2 dimensional array with the corresponding linear
% indices. This is because the linear indices match the shape of the input
% arguments, and in this example they were given as two dimensional
% matrices.
%
% Therefore, it follows that the line below is using the same logic with an
% extra dimension. The size argument is given, rows, columns, and 3d depths
% are given (selecting all rows and all columns and 3d depths), before they
% are finally paired up with 4d depths which do not select every single 4d
% value, but only the depth which corresponds to the pixel with the
% furthest distance from the median pixel within the same 4d depth.
linearIndices = sub2ind([m,n,p,q],I,J,K,fourDDepthIndices);
% When a multidimensional array is indexed with a single other array, MatLab
% assumes that the array being used for the indexing is populated with the
% values for linear indices. E.g. if the indexing array contains an element
% with the value '4', after indexing it will be replaced with the value in
% the original array which corresponds to the linear index '4'. Therefore,
% the below line of code uses the indices from sub2ind to create a three
% dimensional array from the 4 dimensional images array. This new array
% contains only the furthest values from the median, resulting in the
% action shot
filteredImage = uint8(images(linearIndices));
end

% Links explaining sub2ind
% https://au.mathworks.com/help/matlab/ref/sub2ind.html
% https://au.mathworks.com/matlabcentral/answers/433178-using-a-vector-as-
%   an-index-to-a-matrix?s_tid=answers_rc1-1_p1_Topic
% Link explaining ndgrid
% https://au.mathworks.com/help/matlab/ref/ndgrid.html
% Links explaining linear indexing:
% https://au.mathworks.com/company/newsletters/articles/matrix-indexing-in-matlab.html
% https://matlabtricks.com/post-23/tutorial-on-matrix-indexing-in-matlab

