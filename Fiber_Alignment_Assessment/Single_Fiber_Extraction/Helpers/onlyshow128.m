function [ filtered_images ] = onlyshow128( array_of_images )
%ONLYSHOW128 Summary of this function goes here
%   Detailed explanation goes here

    nElements = numel(array_of_images);
    filtered_images = cell(1,nElements);
    
    for idx = 1:nElements
        image = array_of_images{idx};
        new_image = image;
        
        new_image(image ~= 128) =0;
        filtered_images{idx} = new_image;
    end
    
end

