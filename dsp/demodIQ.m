function [I,Q]=demodIQ(S,Tc,t,ordre)
%Modulateur IQ.

%modulation
%fc est la fréquence de la porteuse (normalisée par rapport à Fe/2).
%t est un vecteur temps de longueur de 0 a L*Te. (Te normalisée).

pI=cos(2*pi*(1/Tc)*t);
pQ=-sin(2*pi*(1/Tc)*t);

B=fir1(ordre,1/Tc);




I=filter(B,1,pI.*S);
Q=filter(B,1,pQ.*S);

