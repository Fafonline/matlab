function sortie=mat_sort(K,polcar);
%
% sortie=mat_sort(K,polcar);
%
% Cette fonction calcule la matrice de sortie 'sortie' 
% correspondant � tous les �tats et une entr�e nulle pour
% un code convolutif de taux 1/n dont on donne:
% la longueur de contrainte K et 
% les n polyn�mes g�n�rateurs dans polcar en octal.
% polcar est une ligne de n valeurs en octal. 
%
% il y a 2*netat sorties diff�rentes: 2 par �tat selon le bit d'entr�e
% mais :
% la sortie pour une entr�e = 1 est le compl�ment logique de la sortie
% pour entr�e = 0.
% On ne calcule donc les sorties que pour une entr�e nulle.
% Chaque sortie est form�e de n bits.
%
% les sorties sont donn�es dans l'ordre correspondant � la num�rotation
% des �tats en binaire. sortie(i) correspond � un �tat dont la 
% repr�sentation binaire est i-1.
% 
% Auteur : G. Baudoin, octobre 1999.
%

n=length(polcar);
netat=2^(K-1);
sortie=zeros(netat,n);
etatbin=de2bi(0:netat-1);
etatbin=etatbin(:,(K-1):-1:1);
for i=0:netat-1 
 for j=1:n
  polyn=oct2gen(polcar(j));
  polyn=polyn(length(polyn)-K+1:length(polyn));
  len=length(etatbin(i+1,:));
  input0=[0 zeros(1,K-1-len) etatbin(i+1,:)];
 sortie(i+1,j)=rem(polyn*input0',2);
 end 
end
