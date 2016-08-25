function [ eroded_images ] = erodeImages( array_of_images,filterRodSize,extras)
%BINARIZEIMAGES Summary of this function goes here
%   Detailed explanation goes here
    
    nElements = numel(array_of_images);
    eroded_images = cell(1,nElements);

    se = strel('disk',filterRodSize);
    
    for index = 1:nElements
       
         eroded_images{index} = imerode(array_of_images{index},se);
         eroded_images{index} = imdilate(eroded_images{index},se);
          
         for j =1:extras
             eroded_images{index} = imerode(eroded_images{index},se);
         end

       
    end
    
    
    
end

