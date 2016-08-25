function [ potencyDens ] = ofdAndPeakDensityFor( image_url )
%OFDANDPEAKDENSITYFOR Summary of this function goes here
%   Detailed explanation goes here
    
 image = imread(char(image_url));

 [a,b,c]=size(image);
 
 if c == 3
    image = rgb2gray(image);
 end
 
 images = {image};
 fouriers = createFFT(images); 
 filterRodSize =3;
 fouriersFiltered =filterFourier( fouriers,filterRodSize );
 
 rotatedFouriersFiltered = rotateImages( fouriersFiltered );
 degreesSeparationForEachLine = 2;
 [imagesWithDegreesLines,arrayOfArrayWithResultsForEach] = addGradeLinesToImages(rotatedFouriersFiltered,degreesSeparationForEachLine);
 potencyDens = getMeanStdAndMaxs( arrayOfArrayWithResultsForEach,degreesSeparationForEachLine );
 
end

