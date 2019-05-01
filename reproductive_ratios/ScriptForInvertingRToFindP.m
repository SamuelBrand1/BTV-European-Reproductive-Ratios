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
PercFarmsRGreaterThanOne = zeros(d1,d2,d3);
I = ~isnan(EUTempSince2000Repaired(:,:,1));
%%
x = 4;
for  i = ((x-1)*36 + 1):(x*36)
    i
    for j = 1:d2
        
        if I(i,j)
           
            C = permute(VCPerBitingMidge(i,j,:),[3 1 2]);
            B = permute(DailyMeanBitesPerCattleZeroFarmREs(i,j,:),[3 1 2]);
            pref_C = EUPrefForCattle(i,j);
            pref_S = EUPrefForSheep(i,j);
            T = permute(EUTempSince2000Repaired(i,j,:),[3 1 2]);
            for p = 0.01:0.01:1
                R_p = RForEachLevelOfP(C,B,pref_C,pref_S,0.115,T, 1 - p);
                F = find(R_p > 1);
                PercFarmsRGreaterThanOne(i,j,F) = p;
            end
        else
            PercFarmsRGreaterThanOne(i,j,:) = NaN;
        end
    end
    
end
%%
str1 = 'PercFarms_';
str2 = num2str(x);
str3 = '.mat';
str = strcat(str1,str2,str3);
save(str,'PercFarmsRGreaterThanOne','-v7.3');
        