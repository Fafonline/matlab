function diag=diagm(X)

%mets sur sur la diagonal les valeurs du vecteur

diag=eye(length(X));

for I=1:length(X)
    diag(I,I)=X(I);
end