function [wavelet,twaxis,Nzeros,logw]=wavelet_gen(wtype,fmin,fmax,wlen,dt,wphd,noise_per)

%%%%% wphd is phase shift in degree (from zero to 360 degree) 

   
if (wtype~=1 && wtype~=2)
    sprintf('Wavelet type is not in the library')
    logw=-1;
    wavelet=[];
    Nzeros=[];
    twaxis=[];
    return;   
end

if fmin >= fmax 
    sprintf('Fmax must be greater than Fmin')
    logw=-1;
    wavelet=[];
    Nzeros=[];
    twaxis=[];    
    return;   
end

if mod(wlen,2)==0
   sprintf('The length of wavelet should be an odd number')
   logw=-1;
   wavelet=[];
   Nzeros=[];
   twaxis=[];    
   return;   
end 

fc=(fmin+fmax)./2;

fmin=fmin./1000; %%%% cycle/ms
fmax=fmax./1000;
fpeak=fc./1000;

th=round(wlen/2)-1;
t1=-th;
t2=th;
t=t1:dt:t2;%%ms
Nzeros=th+1;
twaxis=t;

wphsr=(wphd.*pi)./180; %%%% convert degree to radian

if wtype==1  %%%% Ricker (Class 1)   
    aa=(pi.*fpeak.*dt.*(t)).^2;
    w=(1-2.*aa).*exp(-aa); 
   
   
elseif wtype==2  %%% Bandpass Sinc (Class 2)   
    pf1=(2.*pi.*fmin.*t)+eps;
    pf2=(2.*pi.*fmax.*t)+eps;
    term2=2.*fmax.*sin(pf2)./pf2;
    term1=2.*fmin.*sin(pf1)./pf1;
    w=term2-term1;
    w=interp1(t,w,t,'spline');
end
    
%%%%%%%%%%%%% apply phase shift 
if wphd~=0 
    hw=hilbert(w);
    sph=sin(wphsr);
    cph=cos(wphsr);
    wave=cph*real(hw)-sph*imag(hw);
    wlen1=length(wave);
    th=round(wlen1/2)-1;
    t1=-th;
    t2=th;
    t=t1:dt:t2;%%ms
    Nzeros=th+1;
    twaxis=t;
    
else
    wave=w;
end


%%%% Apply noise 
if (noise_per)~=0
   wave = awgn(wave,noise_per,'measured');
end

   
%%% Normalizing
maxw=max(abs(wave));
wavelet=wave./maxw;
logw=1; 

end




 