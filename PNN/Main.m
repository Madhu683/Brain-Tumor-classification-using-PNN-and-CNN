clc;
clear all;
close all;

load testDatabase.mat
load trainDatabase.mat

T=ind2vec(traintarget)
net= newpnn(trainDatabase,T)

save('net.mat','net');

for x=1:size(testDatabase,2)
    Y = sim(net,testDatabase(:,x));
    Yc = vec2ind(Y)
    predicted(:,x)=Yc
end

for x=1:size(testDatabase,2)
    if(testtarget(1,x)==1)
        ctesttarget(1,x)="pituitary"
    elseif(testtarget(1,x)==2)
        ctesttarget(1,x)="notumor"
    elseif(testtarget(1,x)==3)
        ctesttarget(1,x)="meningioma"
    elseif(testtarget(1,x)==4)
        ctesttarget(1,x)="glioma"
    end
end

for x=1:size(testDatabase,2)
    if(predicted(1,x)==1)
        cpredicted(1,x)="pituitary"
    elseif(predicted(1,x)==2)
        cpredicted(1,x)="notumor"
    elseif(predicted(1,x)==3)
        cpredicted(1,x)="meningioma"
    elseif(predicted(1,x)==4)
        cpredicted(1,x)="glioma"
    end
end

cm = confusionchart(ctesttarget,cpredicted);
cm.Title = 'Brain Tumor Classification Using PNN';
accuracy = sum(testtarget == predicted,'all')/numel(predicted)