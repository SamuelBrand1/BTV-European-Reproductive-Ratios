function [ Biting] = BitingForEachLevelOfP( B,Temp,Wind,p )
%Calculating the biting rate at each level p of location specific
%random effect

% Wind = 2.66;

%This gives the standard deviation of the randon effects on each day
STD = sqrt(1.2738^2 - 2*Temp*1.2738*0.14939*0.58071 + (Temp.^2)*0.14939^2 + Wind^2*0.33733^2 - 2*0.089605*Wind*1.2738*0.33733  - 2*Wind*Temp*0.7588*0.33733*0.14939 ); 

X = exp(STD*norminv(p,0,1));
Biting = min(B.*X,5000);


end

