function [ output_args ] = totalGroupsOfImages( array_of_images )
%TOTALGROUPSOFIMAGES Summary of this function goes here
%   Detailed explanation goes here
    nElements = numel(array_of_images);
    for index = 1:nElements
        
        n=max(max(array_of_images{index}));
        disp(['Fibers Found: ',num2str(n) ]);
        
    end
end

