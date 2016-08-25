function [ output_args ] = hist_of_properties( properties )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    n_properties  = numel(properties);
    images_properties= cell(1,n_properties );

    for images_properties_index = 1:numel(properties)
         props = properties{images_properties_index};
         n_props = numel(props);

         orientations = cell(1,n_props);
         lengths      = cell(1,n_props);
         widths       = cell(1,n_props);

         for prop_index = 1:numel(props)
              prop = props{prop_index};
              width       = prop.MinorAxisLength;
              length      = prop.MajorAxisLength;
              orientation = prop.Orientation;

              if orientation < 0
                  orientation = orientation +180;
              end


              orientations{prop_index} = orientation;
              lengths{prop_index}      = length;
              widths{prop_index}       = width;
         end


         images_properties{images_properties_index}.orientations =  orientations;
         images_properties{images_properties_index}.lengths      = lengths;
         images_properties{images_properties_index}.widths       = widths;

    end
    
    for prop = images_properties
        
        degs    = cell2mat(images_properties{1}.orientations);
        lengths = cell2mat(images_properties{1}.lengths);
        widths  =  cell2mat(images_properties{1}.widths);
        [counts_degs,centers_degs] = hist(degs,20);
        [counts_len,centers_len] = hist(lengths,20);
        [counts_wid,centers_wid] = hist(widths,20);
    end


end

