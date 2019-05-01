%Script for creating European R_0 predictions for cattle and sheep


% Create a discretised viraemia distribution
F_I_Cattle = @(t) 1 - gamcdf(t,5,20.6/5);
F_I_Cattle_vect = arrayfun(F_I_Cattle,0:90);
F_I_Sheep = @(t) (1 - gamcdf(t,14,16.4/14))*exp(-0.0055*t);
F_I_Sheep_vect = arrayfun(F_I_Sheep,0:90);

a = fliplr(F_I_Cattle_vect);
b = fliplr(F_I_Sheep_vect);
[d1,d2,d3] = size(DailyMeanBitesPerCattleZeroFarmREs);

DailyRCattleEU = -99*ones(size(DailyMeanBitesPerCattleZeroFarmREs));
DailyRSheepEU = -99*ones(size(DailyMeanBitesPerCattleZeroFarmREs));

B = min(DailyMeanBitesPerCattleZeroFarmREs,5000);
B = B.*VCPerBitingMidge;
% p = parpool(6);

for  i = 1:d1
    i
    for j = 1:d2

        v = permute(B(i,j,:),[3 1 2]);
        Conv_cattle = conv(v,a);
        R_cattle = Conv_cattle(91:end);
        Conv_sheep = conv(v,b);
        Conv_sheep = 0.115*Conv_sheep;
        R_sheep = Conv_sheep(91:end);
        
        DailyRCattleEU(i,j,:) = R_cattle;
        DailyRSheepEU(i,j,:) = R_sheep;
        
    end
end


save('EURForCattle.mat','DailyRCattleEU','-v7.3');
save('EURForSheep.mat','DailyRSheepEU','-v7.3');


% delete(p)