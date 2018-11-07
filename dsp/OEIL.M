function oeil(x,w,debut,NS)
%
% oeil(x,w,debut,NS)
%
% Cette fonction trace un diagramme de l'oeil
% x est le signal
%
% w est le rapport entier entre la frequence d'echantillonnage
% et la frequence symbole
%
% debut est l'indice du premier echantillon de x pris en compte
%
% N est le nombre de symbole a afficher
%
% G. Baudoin septembre 97

lg=length(x)-debut+1;
n=floor(lg/(w*NS));
M=zeros(w*NS,n);
M(:)=x(debut:debut+n*w*NS-1);
plot(M,'-')

