function [ fouriersFiltered ] = filterFourier( fouriers,filterRodSize )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    nFiles = numel(fouriers);
    se = strel('disk',filterRodSize);
    fouriersFiltered = cell(1,nFiles);
    
    parfor index = 1:nFiles
         img = imerode(fouriers{index},se);
         img = imdilate(img,se);
         img = imerode(img,se);
         img = imdilate(img,se);
%          img = imerode(img,se);
%          img = imdilate(img,se);
%          
         %img = imerode(img,se);
         
         fouriersFiltered{index} = img;
    end

end

