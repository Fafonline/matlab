close all;

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%BPSK%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
M=2; %qpsk
k=log2(M);%nb bits par symbole


%%%%%%%%%Fréquences normalisée%%%%%%
%Fe/2=1;

Te=1/2;

ech_Tb=16;             %Te/Tb
Tb=ech_Tb*Te;
Ts=k*Tb;
K=k*ech_Tb;       %Te/Ts
Tc=K*Te;

N=k*10;

%%%%%%Sequence binaire%%%%%%%
bits=gene_bin(N,0.5);
subplot(2,2,1);
stem(bits);
title('Sequence binaire');

%%%%%%Sequence Symbole%%%%%%%
symbs=gene_sym(bits,M);
subplot(2,2,2);
stem(symbs);
title('Symbole 2-Aire')

%%%%%%%%%Mapping%%%%%%%%%%%%
[Ibin,Qbin]=mapqam(symbs,M);

%%%%%%%%%%%Convolution Peigne%%%%%%%%
I_Dirac=dirac(Ibin,K);
Q_Dirac=dirac(Qbin,K);

I=MEF(I_Dirac,K,'n');
Q=MEF(Q_Dirac,K,'n');

%%%%%%%%%%%Modulation IQ%%%%%%%%%
t=[0:K*(N/k)-1]*Te;
BPSK=modIQ(I,Q,Tc,t);

subplot(2,2,4);
plot(t/Ts,BPSK,'b',t/Ts,I,'.r',t/Ts,Q,'g');
title ('modulation BPSK');
xlabel('Ts');
legend('Signal BPSK','Voie I','Voie Q');

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%QPSK%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%


M=4; %qpsk
k=log2(M);%nb bits par symbole

%%%%%%%%%Fréquences normalisée%%%%%%
%Fe/2=1;
Te=1/2;

ech_Tb=16;             %Te/Tb
Tb=ech_Tb*Te;
Ts=k*Tb;
K=k*ech_Tb;       %Te/Ts
Tc=K*Te;


figure;

N=k*10;
%%%%%%Sequence binaire%%%%%%%
bits=gene_bin(N,0.5);
subplot(2,2,1);
stem(bits);
title('Sequence binaire');


%%%%%%Sequence Symbole%%%%%%%
symbs=gene_sym(bits,M);
subplot(2,2,2);
stem(symbs);
title('Symbole 4-Aire')

%%%%%%%%%Mapping%%%%%%%%%%%%
[Ibin,Qbin]=mapqam(symbs,M);


%%%%%%%%%%%Convolution Peigne%%%%%%%%
I_Dirac=dirac(Ibin,K);
Q_Dirac=dirac(Qbin,K);

I=MEF(I_Dirac,K,'n');
Q=MEF(Q_Dirac,K,'n');


t=[0:K*(N/k)-1]*Te;

QPSK=modIQ(I,Q,Tc,t);

subplot(2,2,4);
plot(t/Ts,QPSK,'b',t/Ts,I,'r',t/Ts,Q,'+g');
title ('modulation Qpsk');
xlabel('Ts');
legend('Signal QPSK','Voie I','Voie Q');



%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%16-QAM%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%


M=16; 
k=log2(M);%nb bits par symbole

%%%%%%%%%Fréquences normalisée%%%%%%
%Fe/2=1;
Te=1/2;

ech_Tb=16;             %Te/Tb
Tb=ech_Tb*Te;
Ts=k*Tb;
K=k*ech_Tb;       %Te/Ts
Tc=K*Te;


figure;

N=k*10;
%%%%%%Sequence binaire%%%%%%%
bits=gene_bin(N,0.5);
subplot(2,2,1);
stem(bits);
title('Sequence binaire');


%%%%%%Sequence Symbole%%%%%%%
symbs=gene_sym(bits,M);
subplot(2,2,2);
stem(symbs);
title('Symbole 16-Aire')

%%%%%%%%%Mapping%%%%%%%%%%%%
[Ibin,Qbin]=mapqam(symbs,M);

%%%%%%%%%%%Convolution Peigne%%%%%%%%
I_Dirac=dirac(Ibin,K);
Q_Dirac=dirac(Qbin,K);

I=MEF(I_Dirac,K,'n');
Q=MEF(Q_Dirac,K,'n');


t=[0:K*(N/k)-1]*Te;

QAM16=modIQ(I,Q,Tc,t);

subplot(2,2,4);
plot(t/Ts,QAM16,'b',t/Ts,I,'r',t/Ts,Q,'+g');
title ('modulation 16-QAM');
xlabel('Ts');
legend('Signal 16-QAM','Voie I','Voie Q');

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%32-QAM%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%


M=32; 
k=log2(M);%nb bits par symbole

%%%%%%%%%Fréquences normalisée%%%%%%
%Fe/2=1;
Te=1/2;

ech_Tb=16;             %Te/Tb
Tb=ech_Tb*Te;
Ts=k*Tb;
K=k*ech_Tb;       %Te/Ts
Tc=K*Te;


figure;

N=k*10;

%%%%%%Sequence binaire%%%%%%%
bits=gene_bin(N,0.5);
subplot(2,2,1);
stem(bits);
title('Sequence binaire');


%%%%%%Sequence Symbole%%%%%%%
symbs=gene_sym(bits,M);
subplot(2,2,2);
stem(symbs);
title('Symbole 32-Aire')

%%%%%%%%%Mapping%%%%%%%%%%%%
[Ibin,Qbin]=mapqam(symbs,M);

%%%%%%%%%%%Convolution Peigne%%%%%%%%
I_Dirac=dirac(Ibin,K);
Q_Dirac=dirac(Qbin,K);

I=MEF(I_Dirac,K,'n');
Q=MEF(Q_Dirac,K,'n');


t=[0:K*(N/k)-1]*Te;
%%%%%%%%%%%Modulation IQ%%%%%%%%%
QAM32=modIQ(I,Q,Tc,t);

subplot(2,2,4);
plot(t/Ts,QAM32,'b',t/Ts,I,'r',t/Ts,Q,'+g');
title ('modulation 32-QAM');
xlabel('Ts');
legend('Signal 32-QAM','Voie I','Voie Q');




























