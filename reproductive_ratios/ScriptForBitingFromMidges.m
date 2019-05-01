%Script for generating predicted mean bites per cattle per day including a 0.18 scaling
%factor from the stochastic analysis

load('EUMeanTempSince2000.mat');
load('EUMeanRainfallLastWeekSince2000.mat'); % Load the repaired times series for EU
load('EULatLongDays.mat');
%%
EULong = double(Long(FLong));
EULat = double(Lat(FLat));
%%
[d1,d2,d3] = size(EUTempSince2000Repaired);
I = ~isnan(EUTempSince2000Repaired(:,:,1)); 

DailyMeanBitesPerCattleZeroFarmREs = zeros(d1,d2,d3);
DailyMeanBitesPerCattleZeroFarmREs(:) = NaN;

p = parpool(6);
% ConditionalPredictedTrapCaptures( T,MeanRainLastWeek,W,IsFarm,IsWetlandPrecipCofVar,Lat,DN,X)
for i = 1:d1
    i
    parfor j = 1:d2
        if I(i,j)
            
            x = (min(max(EULat(i)-46,0),3))/3 ;
            for t = 1:d3
                DailyMeanBitesPerCattleZeroFarmREs(i,j,t) = 0.5285*(1-x)*ConditionalPredictedTrapCaptures( EUTempSince2000Repaired(i,j,t),EUMeanRainLastWeek(i,j,t),2.66,1,0,40,PredDays(t),[0,0,0] ) + 0.5285*x*ConditionalPredictedTrapCaptures( EUTempSince2000Repaired(i,j,t),EUMeanRainLastWeek(i,j,t),2.66,1,0,50,PredDays(t),[0,0,0]);
            end
        end
        
        
        
    end
end


delete(p);

% save('BitingPerCattleWindFit.mat','DailyMeanBitesPerCattleZeroFarmREs','-v7.3');

