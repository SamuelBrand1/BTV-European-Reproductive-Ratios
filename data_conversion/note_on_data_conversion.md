# Data for BTV reproductive ratio predictions

The raw climate data for making BTV reproductive ratio predictions is available at http://surfobs.climate.copernicus.eu/dataaccess/access_eobs.php. The livestock distribution data used can be downloaded from here https://livestock.geo-wiki.org/home-2/ .

We have provided three MATLAB® functions:
* create_mat_file_from_nc_file.m - this converts NetCDF (.nc) climate files into MATLAB® (.mat) data.
* repair_climate_datasets.m - this fills gaps in the resultant MATLAB® data using linear interpolation. We have provided this function separately in case any user would prefer to implement an alternative interpolation scheme.
* create_pref_for_cattle_map.m - this converts the geotiff data layer (.tif) for cattle and sheep into a relative biting preference map at the scale of the climate map (that is the grids overlay).

In the paper *Biting midge dynamics and bluetongue transmission: A multiscale model linking catch data with climate and disease outbreaks* we used a spatial grid with south-west corner at (Lat. 35&deg;, Long. -10.5&deg;), north-east corner at (Lat. 71&deg;, Long. 31&deg;). The grid resolution was 0.25&deg; (latitudinally and longitudinally), therefore the spatial grid was 144x166. We used climate data from 1st Jan 2000 until 31st Aug 2016 (6088 days), although results are presented for 2000-2015 in the paper. Therefore, all climate datasets were converted to MATLAB® 144x166x6088 multidimensional arrays.
