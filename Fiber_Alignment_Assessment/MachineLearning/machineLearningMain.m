close all;
clear all;

  trainAligned = openImagesOnRobinFolder( 'Alligned\Train',-1 );
  trainNoAligned = openImagesOnRobinFolder( 'NoAlligned\Train',-1 );
 allImagesTrainDir = fullfile([trainAligned.ImageLocation,trainNoAligned.ImageLocation]);
% % 
% imgSetTrain   = imageSet(allImagesTrainDir);
% % 
% bagOfWordsTrain = bagOfFeatures(imgSetTrain,'VocabularySize',200,'PointSelection','Detector');

  load('trainBagOfWords.mat');
  
% % 
%  trainAlignedFeatures    = encode(bagOfWordsTrain,trainAligned);
%  trainNoAlignedFeatures  = encode(bagOfWordsTrain,trainNoAligned);
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
 testAligned   = openImagesOnRobinFolder( 'Alligned\Test',-1 );
  testNoAligned = openImagesOnRobinFolder( 'NoAlligned\Test',-1 );
% 
% 
% testAlignedFeatures   = encode(bagOfWordsTrain,testAligned);
% testNoAlignedFeatures = encode(bagOfWordsTrain,testNoAligned);
% 
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
 
 load('testTable.mat');
 
% s    = size(trainTable); 
% n_rows = s(1);
% 
% allTrainUrl = [trainAligned, trainNoAligned];
% stdValuesTrain = cell(1,n_rows);
% 
% for i= 1:n_rows
%     
%     stdValuesTrain{i} = ofdAndPeakDensityFor(allImagesTrainDir(i));
% end
% 
% arr = [];
% for j=1:numel(stdValuesTrain)
%     
%     v = stdValuesTrain(j);
%     v = v{1};
%     v = v{1};
%     arr(j,:)=v;
% end
%  
%  proposedFeaturesBagTrain = array2table(arr);
%  % 
%   allignedTrainRows    =trainAligned.Count;
%   noAllignedTrainRows = trainNoAligned.Count;
% % % 
%   c1 = cell(1, allignedTrainRows);
%   c1(:) = {'Alligned'};
% % % 
%   c2 = cell(1, noAllignedTrainRows);
%   c2(:) = {'NoAlligned'};
% % % 
%  proposedFeaturesBagTrain.type = [c1';c2'];
 load('proposedFeaturesBagTrain.mat');
 
%  
% s    = size(testTable); 
% n_rows = s(1);
% 
% allTestUrl = [testAligned, testNoAligned];
% stdValuesTest = cell(1,n_rows);
% 
% allImagesTestDir = fullfile([testAligned.ImageLocation,testNoAligned.ImageLocation]);
% 
% for i= 1:n_rows
%     
%     stdValuesTest{i} = ofdAndPeakDensityFor(allImagesTestDir(i));
% end
% 
% arr = [];
% for j=1:numel(stdValuesTest)
%     
%     v = stdValuesTest(j);
%     v = v{1};
%     v = v{1};
%     arr(j,:)=v;
% end
%  
%  proposedFeaturesBagTest = array2table(arr);
%  % 
%   allignedTestRows    =testAligned.Count;
%   noAllignedTestRows = testNoAligned.Count;
% % % 
%   c1 = cell(1, allignedTestRows);
%   c1(:) = {'Alligned'};
% % % 
%   c2 = cell(1, noAllignedTestRows);
%   c2(:) = {'NoAlligned'};
% % % 
%  proposedFeaturesBagTest.type = [c1';c2'];
 load('proposedFeaturesBagTrain.mat');
 load('ImprovedClassifiers.mat');
 load('normalClassifiers.mat');
predict(trainedClassifierSVM,testTable);