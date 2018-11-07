function [S]=modIQ(I,Q,Tc,t)
%Modulateur IQ.

%I est la voie en phase. Q est la voie en quadrature.
%fc est la fréquence de la porteuse (normalisée par rapport à Fe/2).
%t est un vecteur temps de longueur de 0 a L*Te. (Te normalisée).

pI=cos(2*pi*(1/Tc)*t);
pQ=sin(2*pi*(1/Tc)*t);

S= pI.*I - pQ.*Q;