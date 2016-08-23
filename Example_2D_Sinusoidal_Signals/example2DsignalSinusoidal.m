 clear all;
 close all;
 x = 1:0.01:2*pi;
 y = 1:0.01:2*pi;
 

 magnitudes = [1,5,10];
 angles     = [30,60,85];
 
 [m,n] =  m_and_n_for_display(numel(magnitudes)*numel(angles));
 nEle = 1;
 plotFourier0_plotImages1 =0;
 if plotFourier0_plotImages1 == 1
    figure('Name','Complex Funtions','NumberTitle','off')
 else
    figure('Name','FFT of Complex Funtions','NumberTitle','off')
 end


% mTextBox = uicontrol('style','text')
% set(mTextBox,'String','Hello World')
% set(mTextBox,'Units','characters')
% set(mTextBox,'Position',[100,0,100,1])
%  
 for magnitude =  magnitudes
    for angle  = angles
         t         = angle *pi/180;% convert to radians
         complex = magnitude.*exp(t*sqrt(-1));

         u = real(complex);
         v = imag(complex);

         x_index =0;
         y_index =numel(y);

         for xi =x
               x_index =x_index +1;

               for yi =y
                    signal(y_index,x_index) = cos(2*pi*(u*xi+v*yi)) + j*sin(2*pi*(u*xi+v*yi));
                    y_index = y_index -1;
               end

               y_index =numel(y);
         end

         new_signal = mat2gray(real(signal));
         %imshow(new_signal);
        
         subplot(m,n,nEle);
         
         
         if plotFourier0_plotImages1 == 1
             
             subimage(new_signal);
             
             info_st = ['Mag.: ',num2str(magnitude), ' Ang.: ',num2str(angle),'\circ'];
             title_st = ['U: ',num2str(u, '%.1f'), ' V: ',num2str(v, '%.1f') ];
             title({title_st,info_st}, 'HorizontalAlignment', 'center','fontweight','bold');
             set(gca,'YTick',[]);
             set(gca,'XTick',[]);
             ylabel('Y','fontweight','bold');
             xlabel({'X',strcat('(',char('a'+nEle-1),')')},'fontweight','bold');
             
         else %if  plotFourier0_plotImages1 == 0
            
             F = fft2(new_signal);
             fourier = abs(fftshift(F));
             fourier = mat2gray(fourier)*255;
             s = size(fourier);
             y_quarter = round(s(1)/4);
             x_quarter = round(s(2)/4);
             fourier = fourier(y_quarter:s(1)-y_quarter,x_quarter:s(2)-x_quarter);
             subimage(fourier);
             zoom
             title_st = ['Mag.: ',num2str(magnitude), ' Angle: ',num2str(angle),'\circ'];
             title(title_st, 'HorizontalAlignment', 'center','fontweight','bold');
             set(gca,'YTick',[]);
             set(gca,'XTick',[]);
             ylabel('V','fontweight','bold');
             xlabel({'U',strcat('(',char('a'+nEle-1),')')},'fontweight','bold');
         end
         
         nEle = nEle +1;

    end
 end
 

