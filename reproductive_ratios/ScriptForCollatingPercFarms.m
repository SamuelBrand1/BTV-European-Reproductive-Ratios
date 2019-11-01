%Script for collating the VCs

P2 = load('PercFarms_2.mat');
I = (P2.PercFarmsRGreaterThanOne > 0);
PercFarmsRGreaterThanOne(I) = P2.PercFarmsRGreaterThanOne(I);
I = isnan(P2.PercFarmsRGreaterThanOne);
PercFarmsRGreaterThanOne(I) = P2.PercFarmsRGreaterThanOne(I);
clearvars P2
%%

P3 = load('PercFarms_3.mat');
I = (P3.PercFarmsRGreaterThanOne > 0);
PercFarmsRGreaterThanOne(I) = P3.PercFarmsRGreaterThanOne(I);
I = isnan(P3.PercFarmsRGreaterThanOne);
PercFarmsRGreaterThanOne(I) = P3.PercFarmsRGreaterThanOne(I);
clearvars P3
%%

P4 = load('PercFarms_4.mat');
I = (P4.PercFarmsRGreaterThanOne > 0);
PercFarmsRGreaterThanOne(I) = P4.PercFarmsRGreaterThanOne(I);
I = isnan(P4.PercFarmsRGreaterThanOne);
PercFarmsRGreaterThanOne(I) = P4.PercFarmsRGreaterThanOne(I);
clearvars P4
