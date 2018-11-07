clc
disp('******************************')
disp('Test décodage par algo Viterbi')
disp('******************************')
disp('')

%gestion memoire
clear transition;
clear bitin;
clear bitout;
clear sortie;
clear Dcum;


%Genération séquence binaire
%N=185;
N=16;
bitin=[ gene_bin(N,0.5,0) zeros(1,4) ];

%Codage convolutif
pol1=23;
pol2=33;

polcar=[ pol1 pol2];

K=5;    %profondeur du code
k=1;    %bits emis
n=2;    %bits générés

nbetat=2^(K-1);  %nombre d'état du treillis
sortie=mat_sort(K,polcar);  %calcul des sorties théoriques lors des passages d'un etat à l'autre

seq_code=codconv(bitin,n,k,K,polcar);

%Test de correction d'erreur.
disp('Propabilité d''erreur sur le canal:')
error_rate=0.1

seq_code=addbnoise(seq_code,error_rate);





%%%%DEBUT CONSTRUCTION DU TREILLIS%%%%%%%%%%%%%%%%%%%%%%%%%%

%ATTENTION: pour indexer les matrices et vecteurs ajouter 1 car les etats sont codés de 0 à 15.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Dcum=[0 inf*ones(1,nbetat-1)]';
Dcum_tmp=Dcum;
transition=[];  %matrice mémorisant les chemins survivant
                %etats      k=1     k=2     ...     k=N
                %0                 
                %1          
                %...        
                %16
                
                %On indique d'ou l'on vient.
iteration=0;
%evolution dans le temps
for I=1:2:length(seq_code)-1

        
    %distance cumulée
    for J=0:nbetat-1
        
        iteration=iteration+1; 
        
        Yk=seq_code(I:I+1);
        
        %Etat de 0 à 7.
        if (J<8)
            
            DcumH=Dcum(2*J+1)+dist_hamming(Yk,sortie(2*J+1,:));
            DcumB=Dcum(2*J+1+1)+dist_hamming(Yk,sortie(2*J+1+1,:));
            
            if (DcumH < DcumB)
                Dcum_tmp(J+1)=DcumH;
                transition(J+1,(I+1)/2)=2*J;
            else
                Dcum_tmp(J+1)=DcumB;
                transition(J+1,(I+1)/2)=2*J+1;
            end %end if
                        
        %Etat de 8 à 15.    
        else
            DcumH=Dcum(2*(J-8)+1)+dist_hamming(Yk,1-sortie( 2*(J-8)+1,:));
            DcumB=Dcum(2*(J-8)+1+1)+dist_hamming(Yk,1-sortie( 2*(J-8)+1+1,:));     
            
            if (DcumH < DcumB)
                Dcum_tmp(J+1)=DcumH;
                transition(J+1,(I+1)/2)=2*(J-8);
            else
                Dcum_tmp(J+1)=DcumB;
                transition(J+1,(I+1)/2)=2*(J-8)+1;
            end %end if
        end %end if
           
    end %end for
Dcum=Dcum_tmp;    
end %end for



%%%%%%%%%%%%%%%fin treillis


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%DECODAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

J=0;
[N,M]=size(transition);
M=length(transition);

for I=M:-1:1
    
    if (J<8)
        bitout(I)=0;
    else
        bitout(I)=1;
    end
        
   J=transition(J+1,I); 
   
end

disp('Taux d''erreur en sortie')
e=taux_erreur(bitin,bitout)
iteration


plotvit(transition)








