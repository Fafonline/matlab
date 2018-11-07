function [Y]=randbin(M,N,P)

%RANDBIN	Creer M sequences aléatoires binaires de  N bits.
%		P: Probabilité d'avoir zero (1/2 par default).


if nargin<3
    P=0.5;
end

if(P>1)|(P<0)
error('P doit être dans l''intervalle [0,1]')
end

Y= (sign( rand(M,N) - P ) + 1)/2;

