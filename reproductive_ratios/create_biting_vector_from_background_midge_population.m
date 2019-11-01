function [DailyMeanBitesPerCattle] = create_biting_vector_from_background_midge_population(scaling_parameter,mean_wind_val,Temp_array,Rain_array,days,Lat)
%This function creates a one dimensional array of the expected number of
%bites
%scaling_parameter is the maximum likelihood estimator for the ratio
%between 24 hours of trap captures and the biting per cattle derived from
%the herd serological model
% mean_wind_val is the mean wind value across the area
% Temp_array is a (d1,d2,d3) sized array of the daily mean
% temperature (C)
% T_array is the (d1,d2,d3) sized array of the daily rainfall (mm)
%days is the d3 sized vector of the daynums of each day (this is for
%seasonality
%Lat is the d1 sized area of latitudes for grid array


%%
d1 = length(Temp_array);
DailyMeanBitesPerCattle = zeros(d1,1);
 
x = (min(max(Lat-46,0),3))/3 ; %x is for a linear interpolation between results below 46deg lat and results above 49deg lat
for t = 1:d1
    %Find the mean daily biting
    DailyMeanBitesPerCattle(t) = scaling_parameter*(1-x)*ConditionalPredictedTrapCaptures( Temp_array(t),Rain_array(t),mean_wind_val,1,0,40,days(t),[0,0,0] ) + scaling_parameter*x*ConditionalPredictedTrapCaptures( Temp_array(t),Rain_array(t),mean_wind_val,1,0,50,days(t),[0,0,0]);
end
 

DailyMeanBitesPerCattle = min(DailyMeanBitesPerCattle,5000);

end


