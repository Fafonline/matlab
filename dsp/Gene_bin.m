function bits=gene_bin(N,p0,flag);
%
%function bits=gene_bin(N,p0,flag);
%
% Cette fonction genere une suite binaire aleatoire.
% les valeurs binaires sont +1 et -1 si flag=1
% et 0 et 1 si flag=0.
% p0 = proba(0);
% N = nombre de la suite
%
% Auteur G. Baudoin, 1997

seuil=p0;

bits=sign(rand(1,N)-seuil*ones(1,N));

nuls=find(bits==0);
bits(nuls)=1.*ones(1,length(nuls));

if(flag==0)
 bits=0.5*(bits+ones(1, length(bits)));
end