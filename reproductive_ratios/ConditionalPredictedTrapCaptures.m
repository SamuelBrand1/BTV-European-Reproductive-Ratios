function [Mean] = ConditionalPredictedTrapCaptures( T,MeanRainLastWeek,W,IsFarm,IsWetlandPrecipCofVar,Lat,DN,X)
%Best fit model predictions for captures with random effects
%Translate day into day of year
%IsWetlandPrecipCofVar is the coefficient of variation of rainfall but it
%only applies to wetlands
%VFP distinguishes between regions that ever have a vector free period and
%not. This is crudely Latitude 45?N.
% Output:
% 1) Mean over temporal stochastic events conditional on the farm level
% random effect

%nan values for rainfall ar treated as 0
if isnan(MeanRainLastWeek)
   MeanRainLastWeek = 0; 
end
% day conversion is slow!
day = datenum_to_doy(DN);
% [y,~,~] = datevec(DN);
% day = DN - datenum([y-1,12,31]);
% day = mod(DN,365); %ONLY USE THIS IF DATA IS SET UP CORRECTLY
if day <= 330 && day >=60
VFP = Lat > 45;
%mean prediction conditional on farm level random effects
Mean = exp(-16.059 + X(1) +   8.4878*IsFarm - 4.4521*IsFarm*VFP + 5.3268*VFP  + (1.2687 + X(2))*T - 0.028632*T.^2 + 0.24183*MeanRainLastWeek - (0.26922 + X(3))*W   +  1.0584*IsWetlandPrecipCofVar );%
Mean = Mean.*exp((2.0649*VFP +  1.8604 ).*cos(2*pi*day/365.25) + ( -1.7774*VFP + 0.87101 ).*sin(2*pi*day/365.25) + ( 1.904*VFP ).*cos(4*pi*day/365.25) + (-0.76593*VFP).*sin(4*pi*day/365.25) + 1.8202*VFP.*cos(6*pi*day/365.25));

%Standard results for log-normal distribution which increase the mean
Mean = Mean.*exp((1.3479+  0.7540)/2);

else
Mean = 0;

end


end
