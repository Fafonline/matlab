function symb=gene_symb(bits,M);
%
%symb=gene_symb(bits,M);
%
% Cette fonction calcule une suite "symb" de symboles Maire
% correspondant a la suite binaire "bits" (qui est un vecteur) de valeur +1/-1
% 
% M est le nombre de symboles differents, ce doit etre une puissance de 2
% M = 2^k
% Les symboles generes ont des valeurs entre 0 et M-1, 
% correspondant a des paquets de k bits codes 
%
% Si N est le nombre de bits, [N/k] est le nombre de symboles.
%
% auteur G. Baudoin, 1997

[l,c]=size(bits);
if (min(l,c)~=1)
   disp('bits doit etre un vecteur');
end

if (c<l)
   bits=bits';
end

k=log2(M);
NS=floor(c/k);

bits=bits(1:NS*k);

symb=zeros(1,NS);

ind=find(bits<0);
bits(ind)=0*ones(1,length(ind));

tmp=reshape(bits,k,NS);
% tmp est une matrice a NS (nb de symboles) colonnes
% et chaque colonne est un paquet de k bits
% le 1er element de la colonne est le bit le plus vieux
% c'est aussi le MSB


% Codage des paquets de k bits par un code de Gray
% le LSB est inchange
% et bn=an xor a(n-1)

ponder_bin=2.^[(k-1):-1:0];



symb= ponder_bin*tmp;




 