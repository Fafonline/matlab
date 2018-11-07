function [Y]=bip_code(X)

%CODAGE BIPOLAIRE	Code la sequence binaire X de la manière suivante:
%			0 pour X(I)=0
%			1 ou -1 alternativement pour X(I)=-1
%			Retourne un vecteur Y de même taille que X


%			Copyright Fabrice Alcindor



flag=0;
for I=1:length(X)

	if (X(I)==0),
	Y(I)=0;
	else
		if(flag==0),
		Y(I)=1;flag=1;
		else
		Y(I)=-1;flag=0;
		end
	end
end
