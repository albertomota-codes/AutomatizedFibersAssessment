function [ binarized_images ] = binarizeImages( array_of_images )
%BINARIZEIMAGES Summary of this function goes here
%   Detailed explanation goes here
    
    nElements = numel(array_of_images);
    binarized_images = cell(1,nElements);

    
    
    for index = 1:nElements
        
         img   = array_of_images{index};
         level = graythresh(img);
         binarized_images{index} = im2bw(img,level);
         
    end
    
    
    
end

