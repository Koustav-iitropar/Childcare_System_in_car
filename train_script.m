train=zeros(0,0);
for i=1:20
    filename=['Positive/' num2str(i) '.wav'];
    train=[train;Feature_Extraction(filename,1)];
end
%%
for i=1:9
filename= ['Negative/' num2str(i) '.wav'];
train=[train;Feature_Extraction(filename,0)];
end
%%
n=size(train,2);
Mdl=fitcknn(train(:,1:n-1),train(:,n));

%%

