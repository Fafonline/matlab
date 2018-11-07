
function [XestL,Xest1,ZestL,Zest1,XX,eh]=egalisation_kalman(z,h,h_vrai,sigma_carre,P,moy_Xplus1,varXnplus,D)

%covarXo:       Matrice (L,L). Pour init. Po/o. 
%EspXo:         Vecteur (L,1). Pour init Xo/o.    .  
%varXnplus1:    Scalaire.      Pour calcul la matrice de covariance d'erreur à priori. 
%sigma_carré:   Scalaire.      Puissance de bruit de mesure.
%z:             Vecteur.       Mesures.
%P:             Matrice L,L    Matrice de covariance.

XX=[];
ZZ=[];
hh=[];

%Comment trouver les valeurs statistiques?

L=length(h);
mu=1/L;

%Initialisation

Xkplus_est=moy_Xplus1;

varXnplus=1;


D=[zeros(1,L);[ eye(L-1) zeros(L-1,1)] ]; 
g=[1 zeros(1,L-1)]';

%Debut algo


for n=0:length(z)-1;

    %Prédiction
    P=D*P*D'+g*g'*varXnplus;
    Xkplus_est=D*Xkplus_est;
    
    %Filtrage;

    U=h'*P*h+ sigma_carre;
    K=P*h*(1/U);

    P=(eye(L)-K*h')*P;

    Xkplus_est=Xkplus_est+K*(z(n+1)-h'*Xkplus_est);
    XX=[XX sign(Xkplus_est)];
    [M,N]=size(XX);
    ZZ=[ZZ Xkplus_est];
    
    
    if (n>L-1)
                
        ZestL=ZZ(L,L:N);
        Zest1=ZZ(1,:);
        
        XestL=XX(L,L:N);
        [M,N]=size(XestL);
        Xest1=XX(1,:);
    end
    %Xest=XX(1,:);
    
    
    %identification
    if(n>=2*L)
        
        u=Xest1([n:-1:n-L+1])';
        e(n)=conj(z(n)) - u'*h ;
        h = h + mu*u*e(n);
        hh=[hh h];
        eh(n)= sum( (abs(h-[h_vrai(:,n);zeros(L-length(h_vrai(:,n)),1)])).^2);
    end;
    
end;

XestL=[XestL zeros(1,L-1)];
ZestL=[ZestL zeros(1,L-1)];
