function [ A ] = SpecificRForEachLevelOfP( C,B,AreaPrefForCattle,AreaPrefForSheep,RelPrefForSheep,Temp,p,t )
%Calculating the reproductive ratio at each level p of location specific
[ R,~ ] = RForEachLevelOfP( C,B,AreaPrefForCattle,AreaPrefForSheep,RelPrefForSheep,Temp,p );
A = R(t);

end
