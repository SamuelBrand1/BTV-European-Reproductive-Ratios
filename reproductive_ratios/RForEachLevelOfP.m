function [ R,X ] = RForEachLevelOfP( C,B,AreaPrefForCattle,AreaPrefForSheep,RelPrefForSheep,Temp,p )
%Calculating the reproductive ratio at each level p of location specific
%random effect
Temp = Temp(1:length(C));
B = B(1:length(C));
Wind = 2.66;

% Create a discretised viraemia distribution
F_I_Cattle = @(t) 1 - gamcdf(t,5,20.6/5);
F_I_Cattle_vect = arrayfun(F_I_Cattle,0:90);
F_I_Sheep = @(t) (1 - gamcdf(t,14,16.4/14))*exp(-0.0055*t);
F_I_Sheep_vect = arrayfun(F_I_Sheep,0:90);

F_vect = AreaPrefForCattle*F_I_Cattle_vect + RelPrefForSheep*AreaPrefForSheep*F_I_Sheep_vect;
F_vect = fliplr(F_vect);

%This gives the standard deviation of the randon effects on each day
STD = sqrt(1.2738^2 - 2*Temp*1.2738*0.14939*0.58071 + (Temp.^2)*0.14939^2 + Wind^2*0.33733^2 - 2*0.089605*Wind*1.2738*0.33733  - 2*Wind*Temp*0.7588*0.33733*0.14939 ); 

X = exp(STD*norminv(p,0,1));
Y = min(B.*X,5000);
V = C.*Y;
R = conv(V,F_vect);
R = R(91:end);

end

