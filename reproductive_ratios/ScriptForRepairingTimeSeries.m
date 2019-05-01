%Script for repairing the 'holes' in the EUMeanTemps times series
%Using MATLAB time series linear interpolator

% load('EUMeanTemps.mat');
% 
% I = ~isnan(EUTempDailyAverages(:,:,1)); %Find the non-sea areas
% EUMeanTempsRepaired = zeros(size(EUTempDailyAverages));
% EUMeanTempsRepaired(:) = NaN;
% [d1,d2,d3] = size(EUTempDailyAverages);
% 
% for i = 1:d1
%     for j = 1:d2
%         if I(i,j)
%             T = permute(EUTempDailyAverages(i,j,:),[3 1 2]);
%             ts = timeseries(T,1:length(T));
%             ts = resample(ts,1:length(T));
%             EUMeanTempsRepaired(i,j,:) = ts.Data;
%         end
%     end
% end


I = ~isnan(EUMeanRainLastWeek(:,:,1)); %Find the non-sea areas
EUMeanRainLastWeekRepaired = zeros(size(EUMeanRainLastWeek));
EUMeanRainLastWeekRepaired(:) = NaN;
[d1,d2,d3] = size(EUMeanRainLastWeek);

for i = 1:d1
    for j = 1:d2
        if I(i,j)
            R = permute(EUMeanRainLastWeek(i,j,:),[3 1 2]);
            ts = timeseries(R,1:length(R));
            ts = resample(ts,1:length(R));
            EUMeanRainLastWeekRepaired(i,j,:) = ts.Data;
        end
    end
end

%%
[d1,d2] = size(Temp(:,:,1));
I = false([d1,d2]);

for i = 1:d1
    for j = 1:d2
        I(i,j) = any(~isnan(Temp(i,j,:)));
    end
end