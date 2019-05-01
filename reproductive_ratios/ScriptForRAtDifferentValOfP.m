%Script for inverting the R calculation to find the % of farms with R(t) >=
%1 at each spatial location


load('BitingPerCattleWindFit.mat');
load('EULatLongDays.mat');
EULat = double(Lat(FLat));
EULong = double(Long(FLong));
load('VCPerBitingMidge.mat');
load('EUPrefForCattle.mat');
load('EUPrefForSheep.mat');
load('EUMeanTempSince2000.mat');
%%
[d1,d2,d3] = size(VCPerBitingMidge);
CombinedR0_median = zeros(d1,d2,d3);
CombinedR0_05 = zeros(d1,d2,d3);
CombinedR0_95 = zeros(d1,d2,d3);

I = ~isnan(EUTempSince2000Repaired(:,:,1));

for  i = 1:d1
    i
    for j = 1:d2        
        if I(i,j)           
            C = permute(VCPerBitingMidge(i,j,:),[3 1 2]);
            B = permute(DailyMeanBitesPerCattleZeroFarmREs(i,j,:),[3 1 2]);
            pref_C = EUPrefForCattle(i,j);
            pref_S = EUPrefForSheep(i,j);
            T = permute(EUTempSince2000Repaired(i,j,:),[3 1 2]);            
            CombinedR0_median(i,j,:) = RForEachLevelOfP( C,B,pref_C,pref_S,0.115,T,0.5 );
            CombinedR0_05(i,j,:) = RForEachLevelOfP( C,B,pref_C,pref_S,0.115,T,0.05 );
            CombinedR0_95(i,j,:) = RForEachLevelOfP( C,B,pref_C,pref_S,0.115,T,0.95 );          
        else
            CombinedR0_median(i,j,:) = NaN;
            CombinedR0_05(i,j,:) = NaN;
            CombinedR0_95(i,j,:) = NaN;
        end
    end
    
end
%%

save('CombinedR0_median.mat','CombinedR0_median','-v7.3');
save('CombinedR0_05.mat','CombinedR0_05','-v7.3');
save('CombinedR0_95.mat','CombinedR0_95','-v7.3');

        