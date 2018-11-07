function [DI,DQ]=mapQAM(symb,M);
%
%function [DI,DQ]=mapQAM(symb,M);
%
% Cette fonction donne les coordonnees DI et DQ
% Correspondant à une suite de symboles Maires.
%
% symb = suite de symboles en entree (valeur entre 0 et M-1)
% M nombre de symboles possibles (ici M <32 )
%
% DI = Ak cos(phk), 1 colonne
% DQ = Ak sin(phk), 1 colonne

if(M==2)
  tab_SI=[1,-1];
  tab_SQ=[0,0];
  DI=tab_SI(symb+1)';
  DQ=tab_SQ(symb+1)';
else
  tab_SI=[1 1 -1 -1, 3 3 -3 -3,1 1 -1 -1, 3 3 -3 -3,...
          1 1 -1 -1,5 5 -5 -5,3 3 -3 -3, 5 5 -5 -5
           ];

  tab_SQ=[1 -1 1 -1,1 -1 1 -1, 3 -3 3 -3,3 -3 3 -3,...
          5 -5 5 -5,1 -1  1 -1,5 -5 5 -5,3 -3 3 -3];

  DI=tab_SI(symb+1);
  DQ=tab_SQ(symb+1);
end