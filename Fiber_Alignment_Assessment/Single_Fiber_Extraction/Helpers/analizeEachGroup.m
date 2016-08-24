function [ properties ] = analizeEachGroup( array_of_images )
%ANALIZEEACHGROUP Summary of this function goes here
%   Detailed explanation goes here
    nElements = numel(array_of_images);
    properties = cell(1,nElements);
    
    for index = 1:nElements
        
       img          = array_of_images{index};
       total_groups = max(max(array_of_images{index}));
       local_properties = cell(1,total_groups);
       
       for i =1:total_groups
           
           indexes_of_group = find(img == i);
           tmp_new_img  = zeros(size(img));
           tmp_new_img(indexes_of_group) = 1;
           
           region_prop = regionprops(tmp_new_img,'MajorAxisLength','MinorAxisLength','Orientation','Centroid');
           region_prop.indexes = indexes_of_group;
           local_properties{i} = region_prop;

       end
       
       properties{index} = local_properties;
       
    end

end

