close all;
clear all;

robin1_daniel0 = 1; %To use Robin's Photos set to 1

% if exist('arrayOfImages','var') == 0
%     disp('Opening Images')
%     %arrayOfImages = openImages(robin1_daniel0,2);
%     arrayOfImages = openImages(robin1_daniel0,-1,0);%second parameter -1= printall otherwise only the amount of images
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%CREOOO QUE TODO ESTA MAL TIENES QUE HACVER UNA SOLA BAGS QUE GENERE LAS PALABRAS DE TODAS LAS IMAGES!!!!

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 testAligned = openImagesOnRobinFolder( 'Alligned\Test',-1 );
% trainAligned = openImagesOnRobinFolder( 'Alligned\Train',-1 );
% 
 testNoAligned = openImagesOnRobinFolder( 'NoAlligned\Test',-1 );
% trainNoAligned = openImagesOnRobinFolder( 'NoAlligned\Train',-1 );

% bagOfAlignedTrain   = bagOfFeatures(trainAligned,'VocabularySize',200,'PointSelection','Detector');
% bagOfAlignedTest    = bagOfFeatures(testAligned,'VocabularySize',200,'PointSelection','Detector');
% bagOfNoAlignedTrain = bagOfFeatures(trainNoAligned,'VocabularySize',200,'PointSelection','Detector');
% bagOfNoAlignedTest  = bagOfFeatures(testNoAligned,'VocabularySize',200,'PointSelection','Detector');
% 
 load('allBagsOfFeatures.mat');
% 
 testAlignedFeatures    = encode(bagOfAlignedTrain,testAligned);
% trainAlignedFeatures   = encode(bagOfAlignedTest,trainAligned);
 testNoAlignedFeatures  = encode(bagOfNoAlignedTrain,testNoAligned);
% trainNoAlignedFeatures = encode(bagOfNoAlignedTest,trainNoAligned);
% 
% trainFeats = [trainAlignedFeatures;trainNoAlignedFeatures];
% trainTable = array2table(trainFeats);
% 
% [allignedRows,   dontcare]= size(trainAlignedFeatures);
% [noAllignedRows, dontcare]= size(trainNoAlignedFeatures);
% 
% c1 = cell(1, allignedRows);
% c1(:) = {'Alligned'};
% 
% c2 = cell(1, noAllignedRows);
% c2(:) = {'NoAlligned'};
% 
% trainTable.type = [c1';c2'];


 load('trainTable.mat');

%  testFeats = [testAlignedFeatures;testNoAlignedFeatures];
%  testTable = array2table(testFeats);
% % 
%  [allignedTestRows,   dontcare]= size(testAlignedFeatures);
%  [noAllignedTestRows, dontcare]= size(testNoAlignedFeatures);
% % 
%  c1 = cell(1, allignedTestRows);
%  c1(:) = {'Alligned'};
% % 
%  c2 = cell(1, noAllignedTestRows);
%  c2(:) = {'NoAlligned'};
% % 
%  testTable.type = [c1';c2'];
 %save(testTable)
 load('testTable.mat');
 