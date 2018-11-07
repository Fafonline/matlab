function [W,WW,eh]=MCR(L,x,z,h_vrai)
%Algo moindre carré-recursif

%L:Taille du vecteur W.
%x:l'entrée du système.
%z:sorties du système.
%K:Matrice de Gain
%WW:Matrice de tout les W généré.

N=length(z);
WW=[];
MU=[];
W=zeros(L,1);
    
sigma=0.01;
K =(1/sigma)*eye(L);

for n=L:N
    
    u=x(n:-1:n-L+1)';
    
    K = K - (K * u * u'*K)/(1 + u' * K * u);
    W = W + K* u * (z(n)-u'*W);
    eh(n)=sum(  (W-h_vrai(:,n)).^2 );
    
end;

