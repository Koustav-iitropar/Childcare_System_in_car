function [ y ] = harmonicity_factor( x ,F )
k=5;
y=sort(dct(x),'descend');
y=y(1:k);
y=sum(mod(y,F));
end

