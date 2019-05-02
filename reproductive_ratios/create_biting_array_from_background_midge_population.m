function [DailyMeanBitesPerCattleZeroFarmREs] = create_biting_array_from_background_midge_population(scaling_parameter,mean_wind_val,Temp_array,Rain_array,days,Lat_array)
%This function creates a mulidimensional array of the expected number of
%bites in each grid cell in each day


%%
[d1,d2,d3] = size(Temp_array);
I = ~isnan(Temp_array(:,:,1)); %NaNs in the repaired array indicated grid cells over water which will return a NaN

DailyMeanBitesPerCattleZeroFarmREs = zeros(d1,d2,d3);
DailyMeanBitesPerCattleZeroFarmREs(:) = NaN;

for i = 1:d1
    for j = 1:d2
        if I(i,j)    
            x = (min(max(Lat(i)-46,0),3))/3 ; %x is for a linear interpolation between results below 46deg lat and results above 49deg lat
            for t = 1:d3
                DailyMeanBitesPerCattleZeroFarmREs(i,j,t) = scaling_parameter*(1-x)*ConditionalPredictedTrapCaptures( Temp_array(i,j,t),Rain_array(i,j,t),mean_wind_val,1,0,40,days(t),[0,0,0] ) + scaling_parameter*x*ConditionalPredictedTrapCaptures( Temp_array(i,j,t),Rain_array(i,j,t),mean_wind_val,1,0,50,days(t),[0,0,0]);
            end
        end
    end
end



end

