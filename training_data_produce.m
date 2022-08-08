clc
clear 
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% create training data 
noise_per=0; %%% noise percetage should be zero for training data set(do not change it)

wtypes=[1,2];               %%%%%% wavelet types (1: Class 1, 2:Class 2) 

fmins=[0:15];               %%% wavelet min frequency (varying between 0 to 15 with increment 1)  

fmaxs=[70:150];             %%%% wavelet max frequency (varying between 70 to 150 with increment 1)

wlens=[51:4:251];           %%%%%% wavelet length (has to be an odd number and varying between 51 to 251 with increment 4)

wphds=[0:5:360];            %%% wavelet phase shift in degree ( varying between 0 to 360 with increment 5)

dt=1;                       %%% sample rate (do not change this parameter)

N = 10000                   %%% number of samples to generate
for i = 1:N
    idx=randperm(length(wtypes),1);
    wtype=wtypes(idx);
    idx=randperm(length(fmins),1);
    fmin=fmins(idx);
    idx=randperm(length(fmaxs),1);
    fmax=fmaxs(idx);
    idx=randperm(length(wlens),1);
    wlen=wlens(idx);
    idx=randperm(length(wphds),1);
    wphd=wphds(idx);
    
    [wavelet,twaxis_true,Nzeros,logw]=wavelet_gen(wtype,fmin,fmax,wlen,dt,wphd,noise_per);
    filename = "trainset/class_" + num2str(wtype) + "_fmin_" + num2str(fmin) + "_fmax_" + num2str(fmax) + "_wlen_" + num2str(wlen) + "_wphd_" + num2str(wphd) + ".bin";
    fprintf("%s\n",filename)
    % save file
    fileID = fopen(filename,'w');
    fwrite(fileID, wavelet,'single');
    fclose(fileID);
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% display wavelets (true,mean, and PPD)
lw=2;
fs=16;
figure(1)
%%%%%%%%%%%%%%%%%%%%%%%%% time domanin   
plot(twaxis_true,wavelet,'b','LineWidth',lw)
xlabel('Time(msec)','FontSize',fs)
ylabel('Normalized Amplitude','FontSize',fs)
title('Wavelets','FontSize',fs)
grid on
ylim([-1 1]);
set(gca,'FontSize',fs)
