train=zeros(0,0);
for i=1:10
    filename=[ num2str(i) '.wav'];
    train=[train;Feature_Extraction(filename)];
end