function [min,index]=argmin(V)
%[min,index]=argmin(V)
%min est la valeur minimum du vecteur
%index est l'indice du vecteur ou elle se trouve

min=V(1);
index=1;
for I=1:length(V)
    if (V(I)<min)
        min=V(I);
        index=I;
    end
end