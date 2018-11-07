function Y=MEF(X,K,type)
%Prend en entrée des dirac espacés de K*Te et les convolue 
%avec un filtre NRZ,RZ et Biphase de largeur K*Te.

%NRZ
s_NRZ=[ ones(1,K) ];
%RZ
s_RZ=[ ones(1,K/2),zeros(1,K/2)];
%Biphase
s_Biph=[ones(1,K/2),-ones(1,K/2)];


if (nargin==3)

    if (type=='n')
        Y=filter(s_NRZ,1,X);
    end

    if (type=='z')
        Y=filter(s_RZ,1,X);
    end

    if (type=='b')
        Y=filter(s_Biph,1,X);
    end
else
    Y=filter(s_NRZ,1,X);
end
    