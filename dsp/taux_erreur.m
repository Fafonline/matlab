function e=taux_erreur(BINin,BINout)
N=length(BINin);

e=dist_hamming(BINin,BINout)/N;
