%Script for constructing the per biting midge version of the vectorial
%capacity

% Using 10 stage Erlang approximation
% clear
% %% Get mean daily temperatures
load('EUMeanTempSince2000.mat');
load('EULatLongDays.mat');
%%
EULat = double(Lat(FLat));
EULong = double(Long(FLong));
%% Define VC array as same size as temperature array but with 100 less days
VC = -99*ones(length(EULat),length(EULong),length(PredDays) - 90 );
% VC = -99*ones(length(EULat),length(EULong),1 );

[d1,d2,d3] = size(VC);
m = (length(EULat)*length(EULong));
x = m/6;
%% Solve for VC per infected midge

for n = (5*x + 1):6*x
    j = ceil(n/d1);
    i = n - d1*(j-1);
    
    if ~isnan(EUTempSince2000Repaired(i,j,1)) %Only calculate for land areas
        
        Temps = permute(EUTempSince2000Repaired(i,j,:),[3 1 2]);
        VC(i,j,:) = VC_per_biting_vector_array(0.1,Temps,length(PredDays) - 90);
        
        
    else
        
        VC(i,j,:) = NaN;
        
    end
    
    
end

%% Save result

save('VCPerBitingMidge6.mat','VC','-v7.3');