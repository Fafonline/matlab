function sortie=mat_sort(K,polcar);
%
% sortie=mat_sort(K,polcar);
%
% Cette fonction calcule la matrice de sortie 'sortie' 
% correspondant à tous les états et une entrée nulle pour
% un code convolutif de taux 1/n dont on donne:
% la longueur de contrainte K et 
% les n polynômes générateurs dans polcar en octal.
% polcar est une ligne de n valeurs en octal. 
%
% il y a 2*netat sorties différentes: 2 par état selon le bit d'entrée
% mais :
% la sortie pour une entrée = 1 est le complément logique de la sortie
% pour entrée = 0.
% On ne calcule donc les sorties que pour une entrée nulle.
% Chaque sortie est formée de n bits.
%
% les sorties sont données dans l'ordre correspondant à la numérotation
% des états en binaire. sortie(i) correspond à un état dont la 
% représentation binaire est i-1.
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
