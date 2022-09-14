clc;
clear all;
close all;
imageFolder = fullfile("../Dataset/");
imds = imageDatastore(imageFolder, 'LabelSource', 'foldernames', 'IncludeSubfolders',true);



tb1 = countEachLabel(imds)
minSetCount = min(tb1{:,2});
maxNumImages = 300;
minSetCount = min(maxNumImages,minSetCount);
imds = splitEachLabel(imds,minSetCount,'randomized');
tb2 = countEachLabel(imds)


augmenter = imageDataAugmenter( ...
    'RandXReflection',true, ...
    'RandRotation',[-180 180],...
    'RandXScale',[1 4], ...
    'RandYReflection',true, ...
    'RandYScale',[1 4])
[imdstrain,imdstest] = splitEachLabel(imds,0.7,'randomized');
imageSize=[256 256 1];
datastore = augmentedImageDatastore(imageSize,imdstrain,"ColorPreprocessing","rgb2gray");


layers = [ ...
    imageInputLayer(imageSize,'Name','input')  
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer   
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer   
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer   
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,64,'Padding','same')
    batchNormalizationLayer
    reluLayer   
    fullyConnectedLayer(32)
    reluLayer   
    fullyConnectedLayer(16)
    reluLayer   
    fullyConnectedLayer(8)
    fullyConnectedLayer(4)
    
    softmaxLayer
    classificationLayer ];


 lgraph = layerGraph(layers);
 figure
 plot(lgraph)


 options = trainingOptions('sgdm', ...
    'MaxEpochs',100,...
    'InitialLearnRate',1e-4, ...
    'Verbose',true, ...
    'Plots','training-progress');
net = trainNetwork(datastore,layers,options);

save('net',"net")
%analyzeNetwork(layers,options)
imdsTest_rsz = augmentedImageDatastore(imageSize,imdstest,'ColorPreprocessing','rgb2gray')
load net
YPred = classify(net,imdsTest_rsz);


cm = confusionchart(imdstest.Labels,YPred);
cm.Title = 'Brain Tumor Classification Using CNN';
accuracy = sum(imdstest.Labels == YPred,'all')/numel(YPred)
