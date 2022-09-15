# CNN Matlab Live Script
**clc** clears all the text from the Command Window, resulting in a clear screen.<br>
**clear** removes all variables from the current workspace, releasing them from system memory.<br>
**close all**  closes all figures.<br>
```Matlab
clc;
clear all;
close all;
```
**fullfile(filepart1,...,filepartN)** builds a full file specification from the specified folder and file names.
```Matlab
imageFolder = fullfile("../Dataset/");
```
**imageDatastore** creates a datastore from the collection of image data specified by location.
```Matlab
imds = imageDatastore(imageFolder, 'LabelSource', 'foldernames', 'IncludeSubfolders',true);
countEachLabel counts the number of times each unique label occurs in the datastore.
tb1 = countEachLabel(imds)
```
