clc;
clear all;
close all;
imageFolder = fullfile("../br/Testing/");
imds = imageDatastore(imageFolder, 'LabelSource', 'foldernames', 'IncludeSubfolders',true);

tb1 = countEachLabel(imds)
minSetCount = min(tb1{:,2});
maxNumImages = 300;
minSetCount = min(maxNumImages,minSetCount);

imds = splitEachLabel(imds,minSetCount,'randomized');
tb2 = countEachLabel(imds);
augmenter = imageDataAugmenter( ...
    'RandXReflection',true, ...
    'RandRotation',[-180 180],...
    'RandXScale',[1 4], ...
    'RandYReflection',true, ...
    'RandYScale',[1 4])
[imdsTrain,imdsTest] = splitEachLabel(imds,0.7,'randomized');
imageSize=[256 256 3];



%traindatastore = augmentedImageDatastore(imageSize,imdsTrain,"ColorPreprocessing","gray2rgb");
%trainsetSize = length(traindatastore.Files)
%for x=1:trainsetSize
%    if(imdsTrain.Labels(x)=='pituitary')
%        traintarget(1,x)=1
%    elseif(imdsTrain.Labels(x)=='notumor')
%        traintarget(1,x)=2    
%    elseif(imdsTrain.Labels(x)=='meningioma')
%       traintarget(1,x)=3
%    elseif(imdsTrain.Labels(x)=='glioma')
%        traintarget(1,x)=4
%    end
%end
%for x=1:trainsetSize
%    trainDatabase(:,x) = ImgFeatures(traindatastore.Files{x})
%end

%save("trainDatabase.mat","trainDatabase","traintarget")

testdatastore = augmentedImageDatastore(imageSize,imdsTest,"ColorPreprocessing","gray2rgb");
testsetSize = length(testdatastore.Files)
for x=1:testsetSize
    if(imdsTest.Labels(x)=='pituitary')
        testtarget(1,x)=1
    elseif(imdsTest.Labels(x)=='notumor')
        testtarget(1,x)=2    
    elseif(imdsTest.Labels(x)=='meningioma')
        testtarget(1,x)=3
    elseif(imdsTest.Labels(x)=='glioma')
        testtarget(1,x)=4
    end
end
for x=1:testsetSize
    testDatabase(:,x) = ImgFeatures(testdatastore.Files{x})
end
save("testDatabase.mat",'testDatabase','testtarget')
save('Database.mat','trainDatabase','traintarget','testDatabase','testtarget')

