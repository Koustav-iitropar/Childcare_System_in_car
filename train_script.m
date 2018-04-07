train=zeros(0,0);
for i=1:10
    filename=[ num2str(i) '.wav'];
    train=[train;Feature_Extraction(filename,1)];
end
filename= ['negative.wav'];
train=[train;Feature_Extraction(filename,0)];
%%
n=size(train,2);
Mdl=fitcknn(train(:,1:n-1),train(:,n));