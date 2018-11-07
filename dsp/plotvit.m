function plotvit(transition)
treillis=[];
[M,N]=size(transition);

for I=1:M
    etat=I-1;
    for J=N:-1:1
        %chaque �tat
        treillis(I,J)=etat;
        etat=transition(etat+1,J);          
    end
end

treillis=[zeros(M,1) treillis];

plot([0:N],treillis','-o')
title(['Algorithme de VITERBI - Treillis � ' num2str(M) ' �tats']);
xlabel('instants')
ylabel('Etats ')
grid on
