function [D] = repair_climate_datasets(D)
%This function repairs climate datasets derived from E-OBS by linearly
%interpolating missing data points
%% Find the cells that have any non-NaN entries, i.e. land-based cells (cells with all NaN entries are sea areas).
[d1,d2] = size(D(:,:,1));
I = false([d1,d2]);

for i = 1:d1
    for j = 1:d2
        I(i,j) = any(~isnan(D(i,j,:)));
    end
end
%% Repair data sets in each land cell by converting into MATLAB timeseries and using the resample method (defaults to linear interpolation)
for i = 1:d1
    for j = 1:d2
        if I(i,j)
            R = permute(D(i,j,:),[3 1 2]);
            ts = timeseries(R,1:length(R));
            ts = resample(ts,1:length(R));
            D(i,j,:) = ts.Data;
        end
    end
end

end

