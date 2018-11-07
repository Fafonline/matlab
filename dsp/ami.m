function [Y]=ami(X);

bit=0;

for I=1:length(X),
    if (X(I)==0)
        Y(I)=0;
     else
        if (bit==0);
        Y(I)=1;bit=1;
    else
        Y(I)=-1;bit=0;
    end
        
end
end