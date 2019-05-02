# Data for BTV reproductive ratio predictions

The raw climate data for making BTV reproductive ratio predictions is available at http://surfobs.climate.copernicus.eu/dataaccess/access_eobs.php. The livestock distribution data used can be downloaded from here https://livestock.geo-wiki.org/home-2/ .

We have provided three MATLAB® functions:
* create_mat_file_from_nc_file.m - this converts NetCDF (.nc) climate files into MATLAB® (.mat) data.
* repair_climate_datasets.m - this fills gaps in the resultant MATLAB® data using linear interpolation. We have provided this function separately in case any user would prefer to implement an alternative interpolation scheme.
* create_pref_for_cattle_map.m - this converts the geotiff data layer (.tif) for cattle and sheep into a relative biting preference map at the scale of the climate map (that is the grids overlay).
