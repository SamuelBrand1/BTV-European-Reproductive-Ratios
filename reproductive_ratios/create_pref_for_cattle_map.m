function [TotalCattleBitingPref] = create_pref_for_cattle_map(filename_cattle,filename_sheep,intrinsic_pref_for_sheep,bottom_left_ref,map_size,resolution)
%create_pref_for_cattle_map reads in geotiff files and creates a likelihood
%map for a midge biting a cattle (as opposed to a sheep) at a specified resolution 
%filename_cattle == filename of geotiff for cattle density
%filename_sheep == filename of geotiff for sheep density
%intrinsic_pref_for_sheep == chance of biting a sheep if one sheep and one
%cattle is available
%bottom_left_ref == lat,long position of the bottom left of the map
%map_size == number of cells in x and y direction for the output map
%resolution == degree angle of cells for output map (in both lat and long direction)

%% Input geotiffs

[CattleDensity,RC] = geotiffread(filename_cattle);
[SheepDensity,RS] = geotiffread(filename_sheep);

%% Find angle width of cells in geotiff and reduce size of map to include only box

Dangle_lat = RC.CellExtentInLatitude;
Dangle_long = RC.CellExtentInLongitude;

MapLong = RC.LongitudeLimits(1):Dangle_long:(RC.LongitudeLimits(2)-Dangle_long);
MapLat = RC.LatitudeLimits(2):-Dangle_lat:(RC.LatitudeLimits(1)+Dangle_lat); % The Lat array is align positive to negative because of orientation of the geotiff

FLongWorld = find(MapLong >= bottom_left_ref(2) & MapLong <= bottom_left_ref(2) + map_size(2)*resolution(2));
FLatWorld = find(MapLat >= bottom_left_ref(1) & MapLat <= bottom_left_ref(1) + map_size(1)*resolution(1));

% CattleDensity = double(CattleDensity(FLatWorld,FLongWorld));
% SheepDensity = double(SheepDensity(FLatWorld,FLongWorld));

I = CattleDensity >= 0;
CattleDensity(~I) = NaN;
I = SheepDensity >= 0;
SheepDensity(~I) = NaN;

%% Calculate the average number of livestock in the bigger cells

TotalCattle = -99*ones(map_size);
TotalSheep = -99*ones(map_size);
TotalCattleBitingPref = -99*ones(map_size); 

Lat = bottom_left_ref(1):resolution(1):(bottom_left_ref(1) + resolution(1)*map_size(1));
Long = bottom_left_ref(2):resolution(2):(bottom_left_ref(2) + resolution(2)*map_size(2));

% 
for i = 1:map_size(1)
   for j = 1:map_size(2)
      BoxLat = Lat(i);
      BoxLong = Long(j);
      
       % Find Lat./Long. positions on finer grid
       FLat = find(MapLat >= BoxLat & MapLat < BoxLat + resolution(1));
       FLong = find(MapLong >= BoxLong & MapLong < BoxLong + resolution(2));
       
       %Get total cattle and sheep densities in box
       C = CattleDensity(FLat,FLong);
       S = SheepDensity(FLat,FLong);
       
       %Get sums ignoring NaN values 
       TotalCattle(i,j) = nansum(C(:));
       TotalSheep(i,j) = nansum(S(:));
       
       %Calculate the cattle biting pref for the cell
       if TotalCattle(i,j) + TotalSheep(i,j) > 0
           TotalCattleBitingPref(i,j) = TotalCattle(i,j)/(TotalCattle(i,j) + intrinsic_pref_for_sheep*TotalSheep(i,j));
       else
           TotalCattleBitingPref(i,j) = NaN;
       end
           
   end
end



end

