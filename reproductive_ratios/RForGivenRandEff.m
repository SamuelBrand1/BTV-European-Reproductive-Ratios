function [ R,X ] = RForGivenRandEff( C,B,AreaPrefForCattle,AreaPrefForSheep,RelPrefForSheep,Temp,Wind,X )
%Calculating the reproductive ratio at each level p of location specific
%random effect
Temp = Temp(1:length(C));
% Create a discretised viraemia distribution
F_I_Cattle = @(t) 1 - gamcdf(t,5,20.6/5);
F_I_Cattle_vect = arrayfun(F_I_Cattle,0:90);
F_I_Sheep = @(t) (1 - gamcdf(t,14,16.4/14))*exp(-0.0055*t);
F_I_Sheep_vect = arrayfun(F_I_Sheep,0:90);

F_vect = AreaPrefForCattle*F_I_Cattle_vect + RelPrefForSheep*AreaPrefForSheep*F_I_Sheep_vect;
F_vect = fliplr(F_vect);


X = exp(X(1) +  X(2)*Temp + X(3)*Wind   );
Y = min(B.*X,5000);
V = C.*Y;
R = conv(V,F_vect);
R = R(91:end);

end

