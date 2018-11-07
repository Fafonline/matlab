function [max,index]=argmax(V)
%[max,index]=argmax(V)
%max est la veleur maximum du vecteur
%index est l'indice du vecteur ou elle se trouve

max=V(1);
index=1;
for I=1:length(V)
    if (V(I)>max)
        max=V(I);
        index=I;
    end
end