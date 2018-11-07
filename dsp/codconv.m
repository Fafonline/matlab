function outcode=codconv(inbit,n,k,K,polcar);
%
% function outcode=codconv(inbit,n,k,K,polcar);
%
% cette fonction encode une suite binaire inbit
% avec un code convolutif et génère la sortie correspondante out.
% Les paramètres du code sont n,k et K la longueur de contrainte 
% Le code convolutif est décrit à l'aide de n polynômes générateurs
% donnés dans polcar, où polcar est une vecteur ligne de n polynômes 
% générateurs exprimés en octal.
% par exemple, la fonction 1+D^2+D^3 correspond à 1011 en binaire
% et à 13 en octal.
%
% Les conditions initiales du registre à décalage sont nulles.
%
% Auteur : G. Baudoin octobre 1999.

% Calcul des n sorties correspondants à k entrées
% conversion octal binaire

r=length(polcar);
if(r~=n)
 disp('erreur sur la taille de polcar')
end

% On va calculer n entrées puis on les multiplexera
% on calcule une matrice de n lignes et de length(inbit)/k*n
taille =floor((length(inbit)+eps)/k)*k;
outmat=zeros(n,taille/k);

for i=1:n
 polyn=oct2gen(polcar(i));
 j=find(polyn==1);
 polyn=polyn(j:length(polyn));
 tmp=filter(polyn,1,inbit(1:taille));
 tmp=rem(tmp,2);
 outmat(i,:)=tmp(1:k:length(tmp));
end

outcode=reshape(outmat,1,taille*n/k);
