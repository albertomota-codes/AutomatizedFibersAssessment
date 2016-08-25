function [ new_images,colour_new_images ] = showProperties( arrayOfImages,properties )
%SHOWPROPERTIES Summary of this function goes here
%   Detailed explanation goes here

    nElements         = numel(arrayOfImages);
    new_images        = cell(1,nElements);
    colour_new_images = cell(1,nElements);
    
    if numel(properties) ~=  nElements
        disp('What?? the amount of properties and images MUST be the same')
        return
    end
    
    for index = 1:nElements
        prop        = properties{index};
        total_props = numel(prop);
        img         = arrayOfImages{index};
        new_img     = img;
        colour_img  = repmat(new_img,[1 1 3]);
        
        before = numel(find(new_img == 128));
        
        for j = 1:total_props
            property = prop{j};
            center = round(property.Centroid);
            angle  = property.Orientation;
%             length = property.MajorAxisLength;
%             diameter = property.MinorAxisLength;
            [new_img, colour_img] = drawFiber(center,angle,new_img,property.indexes,colour_img);
            
        end
        new_images{index} = new_img;
        colour_new_images{index} = colour_img;
        after             = numel(find(new_img == 128));
        
        disp(strcat(num2str(before),' then:  ',' ', num2str(after)  ));
        
    end
    %numel(find(new_images{1} == 128))
    
    function [new_img,new_color_image] = drawFiber(center,angle,image,indexes,color_image)
         new_img         = image;
         new_color_image = color_image;
         %randomcolor = round(rand(1,3)*255);
         randomcolor = [20,200,20];
         [height,widht] =size(image);
         size_img =size(image);
         
         [rows,columns]=ind2sub(size_img,indexes);
         
         min_x = min(columns);
         max_x = max(columns);
         min_y = min(rows);
         max_y = max(rows);
         
         amplitude_x = abs(max_x - min_x);
         amplitude_y = abs(max_x - min_y);
         

         
         if amplitude_x >= amplitude_y
             index_min_x = find(columns == min_x,1 );
             index_max_x = find(columns == max_x,1 );
             yy1 = rows(index_min_x); 
             yy2 = rows(index_max_x);
             xx1 = min_x;
             xx2 = max_x;
         else
             
             index_min_y = find(rows == min_y,1 );
             index_max_y = find(rows == max_y,1 );
         
             yy1 = min_y; 
             yy2 = max_y;
             xx1 = columns(index_min_y); 
             xx2 = columns(index_max_y); 
             
         end

         % YA NO NECESITO EL ANGULO???
         [ind,ys,xs ] = indexesToDrawALineFrom( xx1,yy1,xx2,yy2,size_img);
         
         new_img(ind) = 128;
         %new_color_image(ind) = randomcolor;
         
         for i = 1:numel(ys)
             ex = xs(i);
             ey = ys(i);
             new_color_image(ey,ex,:) = randomcolor;
             
             if ey-1 >0
                 new_color_image(ey-1,ex,:) = randomcolor;
                 if ex-1 >0
                     new_color_image(ey-1,ex-1,:) = randomcolor;               
                 end
                 
                 if ex+1 >0
                    new_color_image(ey-1,ex+1,:) = randomcolor;
                 end

             end
             
             if ex-1 >0
                 new_color_image(ey,ex-1,:) = randomcolor;
             end
             
             if ex+1 >0
                 new_color_image(ey,ex+1,:) = randomcolor;
             end
             
             if ey+1 >0
                 new_color_image(ey+1,ex,:) = randomcolor;
                 
                 if ex-1 >0
                     new_color_image(ey+1,ex-1,:) = randomcolor;
                 end
                 
                 if ex+1 >0
                     new_color_image(ey+1,ex+1,:) = randomcolor;
                 end
                 
             end
             
         end
         
    end
    
    
%     function [new_img,new_color_image] = drawFiber(center,angle,image,indexes,color_image)
%         
%         % EL CENTER DA LAS CORDENADAS AL REVES< EL PRIMERO ES EQUIISSS (X)
%         
%         new_img = image;
%         new_color_image = color_image;
%         %[height,widht] =size(image);
%         %color_image = zeros(height,widht,3);
%         randomcolor = round(rand(1,3)*255);
%         angles = cell(1,numel(indexes));
%         total = 0;
%         size_img =size(image);
%         
%         tan = tand(angle)*-1;%the negative tangent of the degree
%         
%         if tan == -Inf
%             for i = 1:center(2) 
%                 index_to_draw = sub2ind(size_img,i,center(1));
%                 
%                 for t = find(indexes == index_to_draw)
%                     if new_img(index_to_draw) ~= 128;
%                         new_img(index_to_draw) = 128;
%                         %new_color_image(i,center(1),:) = randomcolor;
%                         new_color_image(i:i+2,center(1)+3:center(1)+3,:) = randomcolor;
%                         
%                         total = total +1;
%                     end
%                 end
%             end
%         else
%             [row,column]=ind2sub(size_img,indexes);
%             
%             min_x = min(column);
%             max_x = max(column);
%             x     = linspace(min_x,max_x,abs(max_x-min_x)*1000);%creating the x-axis
%             
%             %y = m*x+b //Why the tan is negative?(mayeb because the Y is in negative direction para abajop crece)
%             % b = y-m*x
%             % y= center(2)... x = center(1)... m = tan RECUERDA QUE EN
%             % CENTER EL PRIMERO ES EN "X" (raro)
%             y = tan*x + (center(2)-tan*center(1));
%             
%             rx = round(x);
%             ry = round(y);
%             %indices = unique(sub2ind(size_img,ry,rx));
%             
%             for suposed_index = 1:numel(ry)
%                 suposed_y = ry(suposed_index);
%                 
%                 if  suposed_y > 0 && suposed_y < size_img(1)
%                     
%                     suposed_x = rx(suposed_index);
%                     sup_index = sub2ind(size_img,suposed_y,suposed_x);
%                     
%                     if(any(indexes == sup_index) && new_img(sup_index) ~= 128)
%                          new_img(sup_index) = 128;
%                          new_color_image(suposed_y,suposed_x,:)   = randomcolor;
%                          new_color_image(suposed_y+1,suposed_x,:) = randomcolor;
%                          new_color_image(suposed_y,suposed_x+1,:)   = randomcolor;
%                          new_color_image(suposed_y+1,suposed_x+1,:) = randomcolor;
%                          
%                          if suposed_y-1 > 0 &&  suposed_x-1 >0
%                             new_color_image(suposed_y-1,suposed_x-1,:) = randomcolor;
%                             new_color_image(suposed_y-1,suposed_x,:) = randomcolor;
%                             new_color_image(suposed_y,suposed_x-1,:) = randomcolor;
%                             new_color_image(suposed_y+1,suposed_x-1,:) = randomcolor;
%                             new_color_image(suposed_y-1,suposed_x+1,:) = randomcolor;
%                          end
%                          
%                         
%                          
%                         total = total +1;
%                     end
%                     
%                     
%                 end
%             end
%             
%             
%         end
%         
%         
% %         for i =1:numel(indexes)
% %             [iii, jjj] = ind2sub(size(image),indexes(i));
% %             angle_betweeen_points = angleBetweenTwoPoints(center,[iii, jjj]);
% %             angles{i} = angle_betweeen_points ;
% %             if(abs(angle_betweeen_points-angle)< 5)
% %                 new_img(indexes(i)) = 128;
% %                 %disp('YEI ENTREEE')
% %                 total = total +1;
% %             end
% %         end
% %         %angles
%         % disp(strcat(num2str(total),' of:  ',' ', num2str(numel(indexes))  ))
% 
% 
%     end

    function [angle] = angleBetweenTwoPoints(center,subOfPixel)
        angle = (atan2(center(1)-subOfPixel(1),center(2)-subOfPixel(2) ));
        angle = angle * 180/pi;
        
        if angle < -90
           angle = angle + 180; 
        end
        
        if angle > 90
            angle = angle - 180;
        end
        
        
    end

end

