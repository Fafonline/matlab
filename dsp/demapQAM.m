function [BIN]=demapQAM(M,I,Q)

N=length(I);

if (M==2)
    for J=1:N
        if(I(J)==1)
            BIN(J)=-1;
        else
            BIN(J)=1;
        end
    end
end

if (M==4)
    for J=1:N
        if (J==1)
            P=1;
        else
            P=2*J-1;
        end
    
        if ( (I(J)==1) & (Q(J)==1) )
            BIN(P:P+1)=[-1 -1];
        end
    
        if (  (I(J)==1) & (Q(J)==-1) )
            BIN(P:P+1)=[-1 1];
        end
    
        if ( (I(J)==-1) & (Q(J)==1) )
            BIN(P:P+1)=[1 -1];
        end
    
        if ( (I(J)==-1) & (Q(J)==-1) )
            BIN(P:P+1)=[1 1];
        end
    end
end