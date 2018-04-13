train=zeros(0,0);
for i=1:19
    filename=['Positive/' num2str(i) '.wav'];
    train=[train;Feature_Extraction(filename,1)];
end
for i=1:2
filename= ['Negative/' num2str(i) '.wav'];
train=[train;Feature_Extraction(filename,0)];
end
n=size(train,2);
Mdl=fitcsvm(train(:,1:n-1),train(:,n));

%%
for i=1:1
    test=zeros(0,0);
    filename = ['Test/' num2str(i) '.wav'];
    test=[test;Feature_Extraction(filename,0)];
    test=test(:,1: end-1);
    output=Mdl.predict(test)
end
