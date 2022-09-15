# Brain-Tumor-classification-using-PNN-and-CNN
## Introduction
In this project, Brain tumors are classified using 2 networks which are Convolutional neural network and Probabilistic neural network.
## Dataset
The dataset which is used to classification is taken from kaggle website. The dataset is categorized into 4 types of tumors which are pitutary,glioma,minglioma and notumor.
Each category consist probably 300-400 MRI images.
## Probablistic  neural network
A probabilistic neural network (PNN) is a sort of feedforward neural network used to handle classification and pattern recognition problems. In the PNN technique, the parent probability distribution function (PDF) of each class is approximated using a Parzen window and a non-parametric function. The PDF of each class is then used to estimate the class probability of fresh input data, and Bayes’ rule is used to allocate the class with the highest posterior probability to new input data. With this method, the possibility of misclassification is lowered. This type of ANN was created using a Bayesian network and a statistical approach known as Kernel Fisher discriminant analysis.

PNN feed numerical values to classify the brain tumor.But dataset has MRI images in N x N matrix form. Basicaly MRI image contains noise which leads wrong classification.
We used Guassion filter to remove noise from image. After that we applied GLCM matrix to get some characteristics values like contrast,homogeniety,etc. These numerical values applied to network prdict output.

We have to divide database into Train and Test respectively 70% and 30% from database. create matrix of charactristic values of each image from database and applied to train the network
finaly tested network with test matrix.
![Probabilistic-neural-network-PNN-structure](https://user-images.githubusercontent.com/70106840/190433765-5cfb9f22-4c7d-4765-9ce4-e41c89f60de3.png)

Accuracy of model is 83%.

## Convoltional  neural network
A Convolutional Neural Network (ConvNet/CNN) is a Deep Learning algorithm which can take in an input image, assign importance (learnable weights and biases) to various aspects/objects in the image and be able to differentiate one from the other. The pre-processing required in a ConvNet is much lower as compared to other classification algorithms. While in primitive methods filters are hand-engineered, with enough training, ConvNets have the ability to learn these filters/characteristics.
![UG_CNN_scheme](https://user-images.githubusercontent.com/70106840/190433925-f07e22df-da7c-4015-89cf-27cb7a6df678.png)

Accuracy of model is 88%


## Results
<p float="middle">
  <img src="https://user-images.githubusercontent.com/70106840/190430642-5ef0789c-233a-485c-ad37-c55a86c4fc0f.jpg" width="400" />
  <img src="https://user-images.githubusercontent.com/70106840/190430650-653247a8-5579-4a09-ac2f-4954dc48f638.jpg" width="400" /> 
  
</p>

