# Data for BTV reproductive ratio predictions

The raw climate data for making BTV reproductive ratio predictions is available at http://surfobs.climate.copernicus.eu/dataaccess/access_eobs.php. We have provided two MATLAB® functions:
* create_mat_file_from_nc_file.m - this converts NetCDF (.nc) climate files into MATLAB® (.mat) data.
* repair_climate_datasets.m - this fills gaps in the resultant MATLAB® data using linear interpolation. We have provided this function separately in case any user would prefer to implement an alternative interpolation scheme.
