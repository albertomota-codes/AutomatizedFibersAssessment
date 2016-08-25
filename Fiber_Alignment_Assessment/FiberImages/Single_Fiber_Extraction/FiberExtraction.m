close all;
clear all;

robin1_daniel0 = 1;

if exist('arrayOfImages','var') == 0
    disp('Opening Images')
    %arrayOfImages = openImages(robin1_daniel0,2);
    arrayOfImages = openImages(robin1_daniel0,1,0);%second parameter -1= printall otherwise only the amount of images
end

if numel(arrayOfImages) == 0
   disp('ZERO Images')     
   return
end

%showArrayOfImages(arrayOfImages);

%binarizar las images 
binarized_images = binarizeImages(arrayOfImages);
%showArrayOfImages(binarized_images);

%EROSION
eroded_images = binarized_images;
eroded_images = erodeImages(binarized_images,1,0);
eroded_images = dilateImages(eroded_images,1,0);

showArrayOfImages(eroded_images);

%Group
grouped_images = groupGroups(eroded_images,200);
%showArrayOfImages(grouped_images);
totalGroupsOfImages(grouped_images);

properties = analizeEachGroup(grouped_images);

[new_images, colours_images] = showProperties(arrayOfImages,properties);
new_images_only128           = onlyshow128(new_images);

%numel(find(new_images_only128{1} == 128))
%showArrayOfImages(new_images_only128);
showArrayOfImages(colours_images);
axis off

images_properties  = arrangeProperties( properties );

plotProperties( images_properties );


% degs    =  cell2mat(images_properties{1}.orientations);
% lengths =  cell2mat(images_properties{1}.lengths);
% widths  =  cell2mat(images_properties{1}.widths);
% [counts,centers] = hist(degs,20);






