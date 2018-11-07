close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%eye-diagramme%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%On a Ts=Te*K d'ou fs=(1/K)*Fe.
%On valeur normalisé Fs=2/K.
K=8; %Ts=K*Te
N=1000;
figure %figure 1

t_symb=[0:(K*N)-1]/K;

symb_bin=randbin(1,N);

%%%%%%%%%%%%%%%NRZ%%%%%%%%%%%%%%
%Code:polaire (1 ou -1).
%fitre:NRZ.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%codage
NRZ_code=polar(symb_bin);
NRZ_dirac=dirac(NRZ_code,K);
%filtrage
NRZ=filter(s_NRZ,1,NRZ_dirac);


%%%%%%%%%%%%%%Biphase%%%%%%%%%%%%%%
%Code:polaire (1 ou -1).
%fitre:Biphase.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%codage
Biph_code=polar(symb_bin);
Biph_dirac=dirac(NRZ_code,K);
%filtrage
Biph=filter(s_Biph,1,Biph_dirac);

%%%%%%%%%%%%%%Biphase%%%%%%%%%%%%%%
%Code:bipolaire (1 0 ou -1).
%fitre:NRZ.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%codage
AMI_code=ami(symb_bin);
AMI_dirac=dirac(AMI_code,K);
%Filtrage
AMI=filter(s_NRZ,1,AMI_dirac);

%Fir ordre 10%
Ordre=1;
B=fir1(Ordre,2/K);
subplot(2,1,1)
freqz(B,1,512);


nbsymb=3;

filt_NRZ=filter(B,1,NRZ);
subplot(2,1,2)
plot(filt_NRZ);
figure;
oeil(filt_NRZ,K,1,nbsymb);

filt_Biph=filter(B,1,Biph);
figure;
oeil(filt_Biph,K,5,nbsymb);


B2=fir1(Ordre,4/K);
filt_AMI=filter(B2,1,AMI);
figure;
oeil(filt_AMI,K,1,nbsymb);


