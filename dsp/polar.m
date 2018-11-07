function [Y]=polar(X);

for I=1:length(X),
    if (X(I)==0)
        Y(I)=-1;
    else
        Y(I)=1;
        
    end
end

