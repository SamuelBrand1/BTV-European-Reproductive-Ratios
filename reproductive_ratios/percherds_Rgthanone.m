function [PercFarmsRGreaterThanOne] = percherds_Rgthanone(C,B,pref_C,pref_S,pi_S,Temp)
%percherds_Rgthanone: This function recursively find all the days at which
%the herd has R_p >= 1 for a decreasing set of p and records the lowest
%value p where this is true. This is the estimate for P - the proportion of
%herd that were capable of amplifying BTV if an initial infectious had
%occured on that day.

R_p = RForEachLevelOfP(C,B,pref_C,pref_S,pi_S,Temp, 0.99);
PercFarmsRGreaterThanOne = zeros(length(R_p),1);

 for p = 0.01:0.01:1
    R_p = RForEachLevelOfP(C,B,pref_C,pref_S,pi_S,Temp, 1 - p);
    F = R_p >= 1;
    PercFarmsRGreaterThanOne(F) = p;
 end
 
end



