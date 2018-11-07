function [bitout,sortie,transition,nbetat]=egalvit(mesures,h,tozero,pv)

%[BITOUT,SORTIE,TRANSITION,NBETAT]=egalvit(MESURES,h,TOZERO,PV)
%
%Egalisation par algorithme de VITERBI
%
%BITOUT est la s�quence binaire �galis�e.
%
%h est la reponse impulsionnelle du canal de la forme [1 a0 a1 ...]'
%de longueur maximal 4.
%MESURES est le vecteurs des mesures effectu�es en sortie du canal.
%
%Cette fonction fournit apr�s calculs la matrices des sorties SORTIE qui
%donne la sortie th�orique pour chaques transitions hautes du treillis 
%(dans notre cas passage d'un �tat a un autre qaund on re�oit un 0).

%TRANSITION correspond � la matrice de transitions
%m�morisant les chemins survivant

                %etats      k=1     k=2     ...     k=N
                %0                 
                %1          
                %...        
                %16
 %chaque case corespond � l'�tat d'ou on vient.
 
 %TOZERO est un flag qui indiquera si on retourne forcement
 %� l'�tat "zero" (que des zeros en m�moire) � la fin de la s�quence.
 %TOZERO=0 : =>etat zeros sinon chemin qui poss�de la distance cumul�e 
 % la plus faible.
 %Par default TOZERO=1.
 
 %NBETAT correspond  au nombre d'�tats du treillis
 %PV = 1 affichera le treillis simplifier (que les chemins allant de bout en bout)
 

 if (nargin < 4)
      if (nargin < 3)
         pv=1
         tozero=1;
     else
         pv=1;
     end
 else
     pv=1;
 end
 
     
 
clc
disp('******************************')
disp('Test d�codage par algo Viterbi')
disp('******************************')
disp('')

%gestion memoire
clear transition;
clear bitin;
clear bitout;
clear sortie;
clear Dcum;

nbetat=2^(length(h)-1);  %nombre d'�tat du treillis


if(length(mesures)<nbetat)
    disp('les s�quences de mesures est trop courte pour r�soudre l''algorithme.V�rifier qu''elle soit aussi longue que le nombre d''�tat du syst�me. ')
    break;
end




switch nbetat
case 2
    sortie=[h'*[ [ -1 -1]' [-1 1]'] ]';
case 4
    sortie=[h'*[ [ -1 -1 -1]' [-1 -1 1]' [-1 1 -1]'  [ -1 1 1]' ] ]';  %calcul des sorties th�oriques lors des passages d'un etat � l'autre
case 8
    sortie=[h'*[ [  -1 -1 -1]' [ -1 -1 1]' [ -1 1 -1]'  [ -1 1 1]' [  1 -1 -1]' [ 1 -1 1]' [ 1 1 -1]'  [ 1 1 1]' ] ]'

end





%%%%DEBUT CONSTRUCTION DU TREILLIS%%%%%%%%%%%%%%%%%%%%%%%%%%

%ATTENTION: pour indexer les matrices et vecteurs ajouter 1 car les etats sont cod�s de 0 � 15.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Dcum=[0 inf*ones(1,nbetat-1)]';
Dcum_tmp=Dcum;
transition=[];  %matrice m�morisant les chemins survivant
                %etats      k=1     k=2     ...     k=N
                %0                 
                %1          
                %...        
                %16
                
                %On indique d'ou l'on vient.

%evolution dans le temps
for I=1:length(mesures)

        
    %distance cumul�e
    for J=0:nbetat-1
        
               
        Yk=mesures(I);
        
        %Etat de 0 � 1.
        if (J<nbetat/2)
            
            DcumH=Dcum(2*J+1)+erreurquad(Yk,sortie(2*J+1,:));
            DcumB=Dcum(2*J+1+1)+erreurquad(Yk,sortie(2*J+1+1,:));
            
            if (DcumH < DcumB)
                Dcum_tmp(J+1)=DcumH;
                transition(J+1,I)=2*J;
            else
                Dcum_tmp(J+1)=DcumB;
                transition(J+1,I)=2*J+1;
            end %end if
                        
        %Etat de 2 � 3.    
        else
            DcumH=Dcum(2*(J-(nbetat/2))+1)+erreurquad(Yk,sortie( 2*(J-(nbetat/2))+1,:)+2);
            DcumB=Dcum(2*(J-(nbetat/2))+1+1)+erreurquad(Yk,1-sortie( 2*(J-(nbetat/2))+1+1,:)+2);     
            
            if (DcumH < DcumB)
                Dcum_tmp(J+1)=DcumH;
                transition(J+1,I)=2*(J-(nbetat/2));
            else
                Dcum_tmp(J+1)=DcumB;
                transition(J+1,I)=2*(J-(nbetat/2))+1;
            end %end if
        end %end if
           
    end %end for
Dcum=Dcum_tmp;    
end %end for

Dcum

%%%%%%%%%%%%%%fin treillis


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%DECODAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if (tozero==0)
    J=0;
else
    [min,index]=argmin(Dcum);
    J=index-1;
end

[N,M]=size(transition);
M=length(transition);

for I=M:-1:1
    
    if (J<nbetat/2)
        bitout(I)=0;
    else
        bitout(I)=1;
    end
        
   J=transition(J+1,I); 
   
end

if (pv==1)
plotvit(transition)
end
% 
% 
% 
% 
% 