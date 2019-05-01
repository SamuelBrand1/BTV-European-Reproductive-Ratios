function [D,Time,Lat,Long] = create_mat_file_from_nc_file(filename,main_var_string)
%Creates a MATLAB data structure from input NetCDF climate data with
%filename 'filename'. 
%main_var_string indicates which climate variable is appropriate
% 'tg' == mean daily temperature
% 'rr' == mean daily rainfall

DN0 = datenum([1950,1,1]); %Days are in "Days since 1/1/1950"

%% Read in variables that occur in all the E-OBS
Time = ncread(filename,'time');
Time = double(Time + DN0); %Convert into MATLAB datenums
Lat = ncread(filename,'latitude');
Long = ncread(filename,'longitude');

%% Read in the data 
D = ncread(filename,main_var_string);
%% Reduce dataset so only returns dates since 1/1/2000
F = Time >= datenum(2000,1,1);
D = D(:,:,F);
Time = Time(F);

end

