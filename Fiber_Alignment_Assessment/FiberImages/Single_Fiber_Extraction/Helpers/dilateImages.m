function [ dilated_images ] = dilateImages( array_of_images,filterRodSize,extras )
%DILATEIMAGES Summary of this function goes here
%   Detailed explanation goes here

    nElements = numel(array_of_images);
    dilated_images = cell(1,nElements);

    se = strel('disk',filterRodSize);
    
    for index = 1:nElements
       
         dilated_images{index} = imdilate(array_of_images{index},se);
          
         for j =1:extras
             dilated_images{index} = imdilate(dilated_images{index},se);
         end

       
    end
    
end

