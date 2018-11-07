function outcode=codconv(inbit,n,k,K,polcar);
%
% function outcode=codconv(inbit,n,k,K,polcar);
%
% cette fonction encode une suite binaire inbit
% avec un code convolutif et g�n�re la sortie correspondante out.
% Les param�tres du code sont n,k et K la longueur de contrainte 
% Le code convolutif est d�crit � l'aide de n polyn�mes g�n�rateurs
% donn�s dans polcar, o� polcar est une vecteur ligne de n polyn�mes 
% g�n�rateurs exprim�s en octal.
% par exemple, la fonction 1+D^2+D^3 correspond � 1011 en binaire
% et � 13 en octal.
%
% Les conditions initiales du registre � d�calage sont nulles.
%
% Auteur : G. Baudoin octobre 1999.

% Calcul des n sorties correspondants � k entr�es
% conversion octal binaire

r=length(polcar);
if(r~=n)
 disp('erreur sur la taille de polcar')
end

% On va calculer n entr�es puis on les multiplexera
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
