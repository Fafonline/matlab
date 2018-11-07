function [W,WW,e,eh]=LMS(L,mu,x,z,h_vrai)
%Algo gradient stochastique

%L:Taille du vecteur W.
%x:l'entr�e du syst�me.
%z:sorties du syst�me.
%WW:Matrice de tout les W g�n�r�.

N=length(z);
WW=[];
MU=[];
W=zeros(L,1);
    

for n=L:N
    u=x(n:-1:n-L+1)';
    e(n)=conj(z(n)) - u'*W ;
    W = W + mu*u*e(n);
     WW=[WW W];
%     MU=[MU mu];
    
    eh(n)= sum( (abs(W-[h_vrai(:,n);zeros(L-length(h_vrai(:,n)),1)])).^2);
    
end;

