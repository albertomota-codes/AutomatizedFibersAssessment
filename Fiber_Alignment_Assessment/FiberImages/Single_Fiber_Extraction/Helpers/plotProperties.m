function [ output_args ] = plotProperties( properties )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    n_props = numel(properties);
    
    degreesFigure = figure;
    lengthsFigure = figure;
    widthFigure   = figure;
    
    [m,n] = m_and_n_for_display( n_props );

    number_of_groups = 20;
    file_end = '.xlsx';
    for index = 1:n_props
        
        filename_base =  strcat('Image_',num2str(index));
        
        prop = properties{index};
        degs    = cell2mat(prop.orientations);
        lengths = cell2mat(prop.lengths);
        widths  =  cell2mat(prop.widths);
        
        filename = strcat(filename_base,'_DEGREES_',file_end);
        %xlswrite(filename,degs);
        
        filename = strcat(filename_base,'_LENGTH_',file_end);
        %xlswrite(filename,lengths);
        
        filename = strcat(filename_base,'_WIDTH_',file_end);
        %xlswrite(filename,widths);
        
        [countsDegs,centersDegs]   = hist(degs,number_of_groups);
        [countsLengs,centersLengs] = hist(lengths,number_of_groups);
        [countsWids,centersWids]   = hist(widths,number_of_groups);
        
        
        maxDeg = centersDegs(find(max(countsDegs) == countsDegs,1));
        maxLen = countsLengs(find(max(countsLengs)== countsLengs,1));
        maxWid = centersWids(find(max(countsWids) == countsWids,1));
        
        figure(degreesFigure);
        subplot(m,n,index);
        bar(centersDegs,countsDegs);
        title(['Orientation: ',num2str(maxDeg),'\circ' ]);
        
        figure(lengthsFigure);
        subplot(m,n,index);
        bar(centersLengs,countsLengs);
        title(['Length: ',num2str(maxLen)]);
        
        figure(widthFigure);
        subplot(m,n,index);
        bar(centersWids,countsWids);
        title(['Width: ',num2str(maxWid)]);

    end
    
end

