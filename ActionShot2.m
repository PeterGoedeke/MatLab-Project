function filteredImage = ActionShot2(imagesCells)
%ACTIONSHOT2 Summary of this function goes here
%   Detailed explanation goes here
imagesCells = ReadImages('SuppliedCode\lunar', GenerateImageList('SuppliedCode\lunar', 'jpg'));
% imagesCells = ReadImages('SuppliedCode\tiny', GenerateImageList('SuppliedCode\tiny', 'png'));
images = cat(4,imagesCells{:});

[r, c, ~, imnum] = size(images);
xdtest = zeros(r, c, 3);

% MostDistantPixel2(reshape(permute(images(2,2,:,:), [1 2 4 3]), 1, [], 3))

medians = double(median(images, 4));
images = double(images);
temp = zeros(1, imnum);

% distance = (point1(1)-point2(1))^2 + (point1(2)-point2(2))^2 + (point1(3)-point2(3))^2;

temp = (images(:,:,1,:) - medians(:,:,1)).^2 + (images(:,:,2,:) - medians(:,:,2)).^2 + (images(:,:,3,:) - medians(:,:,3)).^2;

r2 = size(images);
r1 = reshape(images(:), r2);


% reshape(images(:), size(images)) == images;

% temp
[~, index] = max(temp,[],4);
% value
% index

[m,n,p,q] = size(images);
[I,J,K] = ndgrid(1:m,1:n, 1:p);
xdtest = images(sub2ind([m,n,p,q],I,J,K,repmat(index,[1,1,3])));

% images( , ,:, )

% images(:,:,index)
% newboy = images(:,:,:,index)
% [i,j] = size(index);

% for i=1:i
%     for j=1:j
%         xdtest(i,j,:) = images(i,j,:,index(i,j));
%     end
% end


% t = zeros(1, length(index));
% for i=1:i
%     for j=1:j
%         x = sub2ind(size(images), i,j,1,index(i,j));
%         t = [t [x, x + 4, x + 8]]
%         
%     end
% end

% for i = 1:r
%     for j = 1:c
% %         for k = 1:imnum
% %             temp(k) = PixelDistance(medians(i,j,:), images(i,j,:,k)); % This line slow & pixel distance slow
% %         end
%         temp = (images(i,j,1,:) - medians(i,j,1)).^2 + (images(i,j,2,:) - medians(i,j,2)).^2 + (images(i,j,3,:) - medians(i,j,3)).^2;
%         [~, index] = max(temp);
%         xdtest(i,j,:) = images(i,j,:,index);
% 
%         % xdtest(i,j,:) = MostDistantPixel2(reshape(permute(images(i,j,:,:), [1 2 4 3]), 1, [], 3));
%     end
% end

% imshow(uint8(xdtest))
% imwrite(uint8(xdtest), 'test.jpg')
% 
%  % get the figure and axes handles
%  hFig = gcf;
%  hAx  = gca;
%  % set the figure to full screen
%  set(hFig,'units','normalized','outerposition',[0 0 1 1]);
%  % set the axes to full screen
%  set(hAx,'Unit','normalized','Position',[0 0 1 1]);
%  % hide the toolbar
%  set(hFig,'menubar','none')
%  % to hide the title
%    set(hFig,'NumberTitle','off');

end

