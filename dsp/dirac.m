function [Y]=dirac(X,K)
%DIRAC		Transforme une suite binaire en train d'impulsion de dirac
%		de période Ts=K*Te;

N=length(X);
Y=zeros(1,N*K);
Y(1:K:N*K)=X;

