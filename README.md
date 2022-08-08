# Wavelet_Classification_CNN

A package for wavelet classification using deep learning (DL) technique and especially convolutional neural networks (CNN) in Python environment and using Tensorflow/Keras libraries. The training and test data are generated in MATLAB. 

The motivation of this work was the fact that we usually have an estimate of wavelet characteristics (Shape and phase) in signal and image processing, but we need to know what the nearest wavelet type/category is to match with data, so we can use the mathematical forms in our analysis. Our paper included here, shows the exact need in seismic inversion, but I think this is a universal problem and has many applications. To that end, the contributors are welcome to include other wavelet types, other applications, and converting the code to other programming languages. This work itself is not published yet, so pleaser cite the following paper (included in repo) as a main reference for now. Soon, we will include new publications. 

Shahin, A., Stoffa, P.L., Myers, M.T., 2020, Stochastic seismic-wavelet inversion toward carbonate quantitative interpretation, 82nd EAGE Annual meeting, Amsterdam. 

These are the steps that we have followed to create this repository:
1)	Create 150 training data set for class 1 which is a Ricker wavelet (noise percentage 0%) using MATLAB code (“Wavelet_gen.m”). 
2)	Create 150 training data set for class 2 which is a Sinc wavelet (noise percentage 0%) using MATLAB code (“Wavelet_gen.m”).
3)	Create 10 test data sets for class 1 with noise percentage between 2% to 20% (increment 2%) using MATLAB code (“Wavelet_gen.m”).
4)	Create 10 test data sets for class 2 with noise percentage between 2% to 20% (increment 2%) using MATLAB code (“Wavelet_gen.m”).
5)	Let CNN create a feature matrix in time and frequency domain using Fourier transform.  This step has been done in Python using Tensorflow/Keras libraries.
6)	Train a deep learning (DL) CNN algorithm.
7)	Validate/Evaluate the DL model with noisy test data. 
8)	Visualize the performance of the CNN 


For producing the training and test data, I change these parameters (fmin, fmax, wlen, wphd which are min & max frequencies, wavelet length in ms, and wavelet phase in degree, respectively). It has been tried to randomly sample a wide range of these parameters to enrich the training dataset. I use the MATALB code “training_data_produce.m” and “test_data_produce.m” to produce training and test data sets, respectively.
