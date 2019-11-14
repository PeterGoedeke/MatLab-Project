[imageNames] = GenerateImageList('lunar','jpg');
images = ReadImages('lunar',imageNames);
ActionShot(images);

% test = [1 2 3];
% test2 = uint8(test);

% for i=1:1000000
%    median(test);
%    median(test2);
% end


% for i=1:10
%     RemoveAction(images);
%     temp(images);
% end
