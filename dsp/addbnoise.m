function Y=addbnoise(X,error_rate)
%Y=addbnoise(X,error_rate)
%Ajout un bruit binaire à la sequence binaire d'entrée
%
b=gene_bin(length(X),1-error_rate,0);
for I=1:length(b)
    if (b(I)==1)
        X(I)=1-X(I);
    end
end

Y=X;