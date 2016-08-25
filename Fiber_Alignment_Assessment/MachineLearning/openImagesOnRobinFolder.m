function [ arrayOfImages ] = openImagesOnRobinFolder( folder_name,limited )
%OPENIMAGESONROBINFOLDER Summary of this function goes here
%   Detailed explanation goes here
    root = '..\FiberImages\RobinImages\';
    
    dirText = strcat(root,folder_name,'/');
    
    arrayOfImages = imageSet(dirText);
    
%     f = dir(strcat(dirText,'*.tif'));
% 
%     files ={f.name};
%     offset =0;
%      if limited >= 0
%         nFiles = limited;
%         if isnumeric(offsetImage) && nFiles+offsetImage <= numel(files) && offsetImage > 0
%             offset = offsetImage;
%         end
%      else
%          nFiles = numel(files); 
%          
%      end
%     
%     arrayOfImages = cell(1,nFiles);
%     
%      for k=1:nFiles
%         
%        arrayOfImages{k}=imread(strcat(dirText, files{k+offset}));
%        
%        [a,b,c]=size(arrayOfImages{k});
%        if c == 3
%            arrayOfImages{k} = rgb2gray(arrayOfImages{k});
%        end
%        
%        
%      end
%     
    
end

