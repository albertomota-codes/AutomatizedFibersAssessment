function [ meansAndSTDAndMaxAndMin ] = getMeanStdAndMaxs( arrayOfResultsForEach,degreeSeparation )
%GETMEANSTDANDMAXS Summary of this function goes here
%   Detailed explanation goes here
    figure
    nEle = numel(arrayOfResultsForEach);
    meansAndSTDAndMaxAndMin = cell(1,nEle);
    oriImgArr = cell(1,nEle);
    [m,n] = m_and_n_for_display( nEle );
    for index = 1:nEle
        resultsForCase  = arrayOfResultsForEach{index};
        
        %Swapt to go from 0 to 180
        %middle = floor(numel(resultsForCase)/2);
        %imgArr = horzcat(resultsForCase(middle+1:end),resultsForCase(1:middle));
        %END swap to go from 0 to 180

        % Little filter
        resultsSmooth = smooth(resultsForCase,9);
        oriImgArr{index} = resultsSmooth;

        % Statistical Analysis
        [maxValue,maxIndex]= max(resultsSmooth);
        meanImg = mean(resultsSmooth);
        stdImg  = std(resultsSmooth);
        minVal  = min(resultsSmooth);

        

         %%%%%%%%%%%%%%%%%%%
         %
         % MUCHO POSIBLE ANALIS WIHT FINDPEAK in 2015
         %
         %%%%%%%%%%%%%%%%%%

        % Ploting FIRST
        subplot(m,n,index)
        nEleResultsSmooth =numel(resultsSmooth);
        x = linspace(0,180,nEleResultsSmooth);
        plot(x,resultsSmooth)
        
        %END PLOTTING 

        totalAreaBelowTheCurve = trapz(x,resultsSmooth);
        middle = ((maxValue - minVal)/2) + minVal;

        [separationInXAxis, areaBelowPeak,limits] = areaBelowAPeak(resultsSmooth, x , maxIndex, middle/maxValue, 0.01);

        if areaBelowPeak ==-1
            areaBelowPeak = totalAreaBelowTheCurve;
            separationInXAxis = 1;
            disp('HERE WAS A MISTAKE')
        end
        
        
        normalized_width      = separationInXAxis / nEleResultsSmooth;
         
%         totalOffsetArea = trapz(x,ones(1,numel(x))*minVal);
%         offsetForPeak   = totalOffsetArea *normalized_width;
%         
%         areaBelowPeak = (areaBelowPeak-offsetForPeak);
%         totalAreaBelowTheCurve = totalAreaBelowTheCurve-totalOffsetArea;
        
        normalized_Area       = areaBelowPeak /totalAreaBelowTheCurve;
       
        
        
        potencyDens =  normalized_Area/normalized_width;
        
        
        meansAndSTDAndMaxAndMin{index}= [meanImg,stdImg,maxValue,minVal,potencyDens];
        
        disp(['Area Below Peak: ',num2str(areaBelowPeak),' Total Area: ',num2str(totalAreaBelowTheCurve) ]);
        disp(['width Below Peak: ',num2str(separationInXAxis),' Total Width: ',num2str(nEleResultsSmooth) ]);
        disp(['Area Norm: ',num2str(normalized_Area),' Width Norm: ',num2str(normalized_width) ]);
        disp(['Min: ',num2str(minVal),' Max: ',num2str(maxValue)]);
        disp(['Peak Dens:', num2str(potencyDens )]);
        disp('----------------------------')
        
        
        

        %if meanImg+2*stdImg < maxValue
            letter_of_plot = ['             (',char('a' + index-1) ,')'];
            l1 = strcat('Max Ori. ', num2str(maxIndex*degreeSeparation),'\circ');
            l2 = strcat('Pot: ',num2str(normalized_Area),'. Dens:',num2str(potencyDens));
            l3 = strcat('Left: ',num2str(limits(1)),'. Rigth:',num2str(limits(2)));
            old_title = strvcat(l1,l2,l3);
            l1 = ['Orientation: {\bf{', num2str(maxIndex*degreeSeparation),'}}\circ'];
            l2 = ['Peak Density: \bf{',num2str(potencyDens),'}'];
            new_title = strvcat(letter_of_plot,l1,l2);
            title(new_title,'FontSize', 17);
            xlabel('Angle','fontweight','bold','FontSize', 15)
            ylabel('OFD','fontweight','bold','FontSize', 16)
            %title(old_title);
        %else
            %title(strvcat('NO ORi. ', num2str(maxIndex*degreeSeparation),'deg. Rat:',num2str(ratio),'.\\',num2str(potencyDens)))
        %end

         hold on
%         plot(linspace(0,180,nEleResultsSmooth),ones(1,nEleResultsSmooth)*meanImg,'g')
         plot(linspace(0,180,nEleResultsSmooth),ones(1,nEleResultsSmooth)*middle,'b')
%         plot(linspace(90,90,nEleResultsSmooth),linspace(meanImg-stdImg/2,meanImg+stdImg/2,numel(resultsSmooth)),'r')
         hold off

    end

end

