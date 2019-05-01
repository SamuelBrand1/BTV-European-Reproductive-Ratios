function [ doy ] = datenum_to_doy( DN )
%Translates datenum into day of year
DV1 = datevec(DN);
DV2 = [DV1(:,1)-1,12*ones(length(DN),1),31*ones(length(DN),1)];
doy = datenum(DV1) - datenum(DV2);


end

