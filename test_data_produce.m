%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% create test data 
noise_per=20; %%% noise percetage for test data set(between 2% to 20% with increment 2%)

wtype=2; %%%%%% wavelet types (1: Class 1, 2:Class 2) 

fmin=5.0; %%% wavelet min frequency (varying between 0 to 15 with increment 1)  

fmax=120; %%%% wavelet max frequency (varying between 70 to 150 with increment 1)

wlen=151; %%%%%% wavelet length (has to be an odd number and varying between 51 to 251 with increment 4)

wphd=45.0; %%% wavelet phase shift in degree ( varying between 0 to 360 with increment 5)

dt=1; %%% sample rate (do not change this parameter)
[wavelet,twaxis_true,Nzeros,logw]=wavelet_gen(wtype,fmin,fmax,wlen,dt,wphd,noise_per);

figure(2)
%%%%%%%%%%%%%%%%%%%%%%%%% time domanin   
plot(twaxis_true,wavelet,'b','LineWidth',lw)
xlabel('Time(msec)','FontSize',fs)
ylabel('Normalized Amplitude','FontSize',fs)
title('Wavelets','FontSize',fs)
grid on
ylim([-1 1]);
set(gca,'FontSize',fs)


