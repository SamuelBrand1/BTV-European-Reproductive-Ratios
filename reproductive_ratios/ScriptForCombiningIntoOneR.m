%Combined R0 script
% clear
% load('DailyRCattleEU.mat');
% load('DailyRSheepEU.mat');
% load('LatLongPrefMap.mat');
% load('EULatLongDays.mat');
% load('PrefForCattle.mat');
% load('PrefForSheep.mat');
%%
EURLat = double(Lat(FLat));
EURLong = double(Long(FLong));
%%

% p = parpool(6);
[d1,d2,d3] = size(DailyRCattleEU);
CombinedR0WithoutFarmLevelREs = 0*ones(d1,d2,d3);

for i = 1:d1
    i
    for j = 1:d2
       
        FLat2 = find(EULatPref >= EURLat(i) & EULatPref < EURLat(i) + 0.25);  
        FLong2 = find(EULongPref >= EURLong(j) & EULongPref < EURLong(j) + 0.25);  
        
        Pref_Cattle_mean = nanmean(nanmean(PrefForCattle(FLat2,FLong2)));
        Pref_Sheep_mean = nanmean(nanmean(PrefForSheep(FLat2,FLong2)));
        
        CombinedR0WithoutFarmLevelREs(i,j,:) = DailyRCattleEU(i,j,:)*Pref_Cattle_mean + DailyRSheepEU(i,j,:)*Pref_Sheep_mean;

    end 
end
%% 
save('CombinedRWithoutFarmREs.mat','CombinedR0WithoutFarmLevelREs','-v7.3');
% %% Get a 'correctly' scaled preference map
% 
% EUPrefForCattle = zeros(d1,d2);
% EUPrefForSheep = zeros(d1,d2);
% EUPrefForCattle(:) = NaN;
% EUPrefForSheep(:) = NaN;
% 
% 
% for i = 1:d1
%     i
%     for j = 1:d2
%        
%         FLat2 = find(EULatPref >= EURLat(i) & EULatPref < EURLat(i) + 0.25);  
%         FLong2 = find(EULongPref >= EURLong(j) & EULongPref < EURLong(j) + 0.25);  
%         
%         Pref_Cattle_mean = nanmean(nanmean(PrefForCattle(FLat2,FLong2)));
%         Pref_Sheep_mean = nanmean(nanmean(PrefForSheep(FLat2,FLong2)));
%         
%         EUPrefForCattle(i,j) = Pref_Cattle_mean;
%         EUPrefForSheep(i,j) = Pref_Sheep_mean;
% 
%     end 
% end
% 
% save('EUPrefForCattle.mat','EUPrefForCattle','-v7.3');
% save('EUPrefForSheep.mat','EUPrefForSheep','-v7.3');


