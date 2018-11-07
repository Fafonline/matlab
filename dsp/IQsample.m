function [Is,Qs]=IQsample(Idemod,Qdemod,L,to)
%L nombre d'echantillons par symbole
%to instant d'écahtillonnage (en pourcent de L). en nombre d'échantillon.

Is=Idemod(to:L:length(Idemod));
Qs=Qdemod(to:L:length(Qdemod));




