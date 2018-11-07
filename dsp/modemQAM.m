function [BINout,Idemod,Qdemod]=modemQAM(M,nbsymb)

close all;
k=log2(M);%nb bits par symbole

%%%%%%%%%Fréquences normalisée%%%%%%
%Fe/2=1;
Te=1/2;

ech_Tb=16;             %Te/Tb
Tb=ech_Tb*Te;
Ts=k*Tb;
K=k*ech_Tb;       %Te/Ts
Tc=4*Te;

N=k*nbsymb;
%%%%%%Sequence binaire%%%%%%%
bits=gene_bin(N,0.5);

%%%%%%Sequence Symbole%%%%%%%
symbs=gene_sym(bits,M);

%%%%%%%%%Mapping%%%%%%%%%%%%
[Ibin,Qbin]=mapqam(symbs,M);


%%%%%%%%%%%Convolution Peigne%%%%%%%%
I_Dirac=dirac(Ibin,K);
Q_Dirac=dirac(Qbin,K);

I=MEF(I_Dirac,K,'n');
Q=MEF(Q_Dirac,K,'n');


t=[0:K*(N/k)-1]*Te;

%modulation
QPSK=modIQ(I,Q,Tc,t);


%Demodulation IQ
[Ifiltre,Qfiltre]=demodIQ(QPSK,Tc,t,4);


figure;
to=16;
[Is,Qs]=IQsample(Ifiltre,Qfiltre,Ts/Te,to);

plot(Is,Qs,'*b')
hold on;
plot(Is,Qs,'*r')
title('Constellation après démodulation ');
xlabel('Voie I');
hold off;
ylabel('Voie Q');


[Idemod,Qdemod]=descisionIQ(Is,Qs);


BINout=demapQAM(Idemod,Qdemod);
