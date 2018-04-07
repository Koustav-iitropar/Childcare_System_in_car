function features = Feature_Extraction(filename,bool)
[y,Fs]=audioread(filename);
y=y(:,1);
window_length=ceil(Fs/20);
window=floor(size(y,1)/window_length);
mfccParams = feature_mfccs_init(window_length, Fs);
features=zeros(0,0);
window=floor(window/20)*20;
for i=1:20:window
    data=zeros(0,0);
    for j=i:i+19
    x= y( (j-1)*window_length+1: (j)*window_length,:);
    ceps = feature_mfccs(fft(x), mfccParams );
    ceps=abs(ceps)';
    E=feature_energy(x);
        [H,F] = feature_harmonic(x, Fs);
    data=[data ceps E H F];
    end
    data=[data bool];
    features=[features;data];
    
end