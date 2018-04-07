function data = task1(filename)
[y,Fs]=audioread(filename);
window=500;
window_length=floor(size(y,1)/window);
mfccParams = feature_mfccs_init(window_length, Fs);
data=zeros(0,0);
for i=1:window-1
    x= y( (i-1)*window+1: (i-1)*window + window_length,:);
    ceps = feature_mfccs(fft(x), mfccParams );
    ceps=abs(ceps)';
    E=feature_energy(x);
    windowfft=abs(fft(x));
    %     [H,F] = feature_harmonic(x, Fs);
    [C,S] = feature_spectral_centroid(windowfft, Fs);
    Z = feature_zcr(x);
    if (i~=1)
    F = feature_spectral_flux(windowfft, windowFFTPrev);
    data=[data ceps E C S Z F];
    else
    data=[data ceps E C S Z];
    end
    windowFFTPrev=windowfft;
end