function [ agrouped_images ] = groupGroups( array_of_images,min_size )
%GROUPGROUPS Summary of this function goes here
%   Detailed explanation goes here
    nElements = numel(array_of_images);
    image_groups = cell(nElements,1);
    
    
    
    for index = 1:nElements
         img         = array_of_images{index};
         
         CC = bwconncomp(img);
         groups = CC.PixelIdxList;
         
         new_img = zeros(size(img));
         
         group = 0;
         for i =1:numel(groups)
             
             indexes_of_Group      = groups{i};
             total_num_of_indexes  = numel(indexes_of_Group);
                
             if total_num_of_indexes >= min_size
                 
                group = 1+group; 
                
                for j = 1:total_num_of_indexes         
                     new_img(indexes_of_Group(j)) = group;
                end
                
             end
             
         end
         
         agrouped_images{index} =(new_img) ; 
         
    end

end

