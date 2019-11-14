function filteredImage = ActionShot(images)
%ACTIONSHOT Summary of this function goes here
%   Detailed explanation goes here
images = ReadImages('SuppliedCode\tiny', GenerateImageList('SuppliedCode\tiny', 'png'));
%test1 = sort(cat(4,images{:}), 4);
test1 = cat(4,images{:});

medianPixels = median(test1, 4);

[r,c] = size(test1);
filteredImage = zeros(r,c,3);

test1(1,1,:,:);

reshape(permute(test1(1,1,:,:), [1 2 4 3]), 1, [], 3);

for i = 1:r
   for j = 1:c
%        filteredImage(r,c,:) = MostDistantPixel2(reshape(permute(test1(r,c,:,:), [1 2 4 3]), 1, [], 3));
   end
end

% image(filteredImage);





% median(test1, 4)

% MostDistantPixel2(reshape(permute(test1(1,2,:,:), [1 2 4 3]), 1, [], 3))

% test1(:,:,1:3,[1 round((1+end)/2) end]);

% test1(:,:,1:3,:) = MostDistantPixel2(test1(:,:,1:3,:));

% A = [1 2 0; 3 4 2; 7 8 7];
% [B, I] = sort(A, 2);
% 
% A
% B
% I

% X = [1 2 0; 3 4 2; 7 8 7]
% median(X)
%       scaleX = X - repmat(median(X),length(X),1);
%       XD  = sqrt(sum(abs(scaleX).^2,2));
%       [~,idxs] = sort(XD);
%       XRSorted = X(idxs,:)


end