function [ ind,ys,xs ] = indexesToDrawALineFrom( x1,y1,x2,y2,sizeImg )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    % distances according to both axes
    xn = abs(x2-x1);
    yn = abs(y2-y1);

    % interpolate against axis with greater distance between points;
    % this guarantees statement in the under the first point!
    if (xn > yn)
        xs = x1 : sign(x2-x1) : x2;
        ys = round( interp1([x1 x2], [y1 y2], xs, 'linear') );
    else
        ys = y1 : sign(y2-y1) : y2;
        xs = round( interp1([y1 y2], [x1 x2], ys, 'linear') );
    end

    % 2-D indexes of line are saved in (xc, yc), and
    % 1-D indexes are calculated here:
    ind = sub2ind( sizeImg, ys, xs );
    
end

