%     demo for Multi-Scale Superpixel Based Nearest Subspace Classifier
%------------Brief description------------------------------------
%
%
% This demo implements the Multi-Scale Superpixel Based Nearest Subspace Classifier for
% Mucilage Detection from Hyperspectral PRISMA Data[1]
%
%
% More details in paper:
%
% [1]
%
% contact: kgtoker@gmail.com
%

% clear all; close all; clc
%% Experimental Setup and Parameter setting
disp('Experimental Setup and Parameter setting')
% the number of desired superpixels
num_Superpixels        =   125*sqrt(2).^[14:20] % Bursa2 
%num_Superpixels        =   125*sqrt(2).^[7:13] % use this setting for istanbul mucilage dataset
trainingDataSize = 20; % number of training data
removeTrainingInstancesInNeighborhood = 1;  % If removeTrainingInstancesInNeighborhood = 1,
% We remove the training samples that are in spatial neighborhood of the test samples during classification for fair comparison.
% if removeTrainingInstancesInNeighborhood = 0, The spatial neighborhood of the test samples includes training samples. % This increases classification performance, 
% However, I think that it is not fair. Thus,
% In the paper, we set removeTrainingInstancesInNeighborhood to 1.

%% Add paths to use some functions
addpath('common')
addpath('Entropy Rate Superpixel Segmentation')
addpath('process data')

%% Pick an hyperspectral image and load the data
dataType = 'bursa2' %  use 'istan' to use İstanbul dataset
load([ dataType 'Hyp.mat'])
HypData = double(HypData);
superpixelMethod = 'ERS_';
sz = size(HypData);

%% Get only the labeled data (Get rid of unlabeled instances)
tElapsedAll = [];
accuracyCCAAll = [];
indicesAll = [];
allinOne_All = [];
for indexes = 1:1
    
    [allLabeledData, gtVector, dataCascade, no_classes, numberOfInstancesOfEachClass] = getLabeledDataAndTheirGTs(gt,HypData);

    %% Determine random train and test indices
    % [trainIndexes,testIndexes] = determineTrainAndTestIndices(trainingDataSize, no_classes, allLabeledData, numberOfInstancesOfEachClass);
    % if you want load specific indices, you can use below line.
    load([ dataType 'Index' num2str(indexes) 'trSize' num2str(trainingDataSize) '.mat'])
    
    predLabelMultiscale = [];
    %% Determine train and test data
    [trainData, trainLabel, testData, testLabel] = determineTrainAndTestData(trainIndexes, testIndexes, dataCascade, gtVector, sz);
    tStart = tic
    for inum_Pixel = 1:size(num_Superpixels,2)
        num_Pixel = num_Superpixels(inum_Pixel);
        
        
        %% super-pixels segmentation
        if superpixelMethod == 'ERS_'
            superLabels = cubseg(HypData,num_Pixel);
            if (removeTrainingInstancesInNeighborhood == 1)
                dataRemoveTrainingInstancesInNeighborhood = dataCascade;
                dataRemoveTrainingInstancesInNeighborhood(:,trainIndexes(1,:)) = zeros([sz(3) size(trainIndexes,2)]);
                dataRemoveTrainingInstancesInNeighborhood = reshape(dataRemoveTrainingInstancesInNeighborhood',[sz(1) sz(2) sz(3)]);
                Results_segment = seg_im_class(dataRemoveTrainingInstancesInNeighborhood,superLabels);
            else
                Results_segment = seg_im_class(data,superLabels);
            end
            
            NumOfSuperpixel=max(max(superLabels));
        elseif superpixelMethod == 'SLIC'
            if dataType == 6
                num_Pixel        =   1000; %pca
            elseif dataType == 1
                num_Pixel        =   2050; %pca
            elseif dataType == 8
                
            end
            Y_scale = reshape(data,no_lines*no_rows, no_bands);
            Y=reshape(Y_scale,no_lines, no_rows, no_bands);
            p = 3;
            [Y_pca] = pca(Y_scale, p);
            img = im2uint8(mat2gray(reshape(Y_pca', no_lines, no_rows, p)));
            [superLabels,NumOfSuperpixel] = superpixels(double(img),num_Pixel, 'NumIterations', 40, 'Compactness', 3, 'Method', 'slic');
            dataRemoveTrainingInstancesInNeighborhood = dataCascade;
            dataRemoveTrainingInstancesInNeighborhood(:,trainIndexes(1,:)) = zeros([sz(3) size(trainIndexes,2)]);
            dataRemoveTrainingInstancesInNeighborhood = reshape(dataRemoveTrainingInstancesInNeighborhood',[sz(1) sz(2) sz(3)]);
            Results_segment = seg_im_class(dataRemoveTrainingInstancesInNeighborhood,superLabels);
        end
        
        
        
        %% Classification via CCA
        corrMatrix = [];
        predLabelAll = zeros(1,size(testData,2));
        for i=1:NumOfSuperpixel
            correlations = [];
            if max(max(Results_segment.Y{1,i})) == 0
                predLabel(i) = 0;
                correlations = zeros(1,no_classes);
            else
                for k = 1:no_classes
                    indx = (k-1)*trainingDataSize;
                    trainDataForEachClass = trainData(:,indx+1:indx+trainingDataSize);
                    [A B r U V] = canoncorr(trainDataForEachClass,Results_segment.Y{1,i}');
                    warning('off')
                    correlations = [correlations r(1)];
                end
            end
            [val predLabelAll(Results_segment.index{1,i}) ] = max(correlations);
            
            corrMatrix = [corrMatrix; correlations];
        end
        predLabelMultiscale = [predLabelMultiscale; predLabelAll];
    end
    tElapsed = toc(tStart);  % TOC, pair 2
    %% Classification via CCA
    predLabelAll = label_fusion(predLabelMultiscale')';
    
    predLabelPlot = zeros(sz(1)*sz(2),1);
    predLabelPlot(testIndexes(1,:)) = predLabelAll(testIndexes(1,:));
    % figure,
    % imagesc(reshape(predLabelPlot,[sz(1) sz(2)]))
    accuracyCCA = mean(testLabel == predLabelAll(testIndexes(1,:))) *100;
    accuracyCCAAll = [ accuracyCCAAll accuracyCCA];
    meanAccuracy = mean(accuracyCCAAll);
    gtVector = gt(:);
    StatResults = calErrors(gtVector', predLabelPlot');
    allinOne_All = [allinOne_All; StatResults.allinOne];
    tElapsedAll = [tElapsedAll tElapsed];

%    save([  dataType '\parameterTuning/pred' dataType 'indexes'  num2str(indexes) dataType 'trSize' num2str(trainingDataSize) '_7_1250_7_13' ],'tElapsedAll','predLabelPlot', 'predLabelAll', 'StatResults', 'allinOne_All')

end
close all;
% meanAccuracy = mean(accuracyCCAAll)

% save([  'pred' dataType 'indexes'  num2str(indexes) dataType 'trSize' num2str(trainingDataSize) '_7_num_Pixel' num2str(num_Pixel) ],'predLabelPlot', 'predLabelAll', 'StatResults')

