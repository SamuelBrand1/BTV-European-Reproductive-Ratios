%Script for collating the VCs

VC2 = load('VCPerBitingMidge2.mat');
I = (VC2.VC > -1);
VC(I) = VC2.VC(I);
I = isnan(VC2.VC);
VC(I) = VC2.VC(I);
clearvars VC2
%%

VC3 = load('VCPerBitingMidge3.mat');
I = (VC3.VC > -1);
VC(I) = VC3.VC(I);
I = isnan(VC3.VC);
VC(I) = VC3.VC(I);
clearvars VC3
%%

VC4 = load('VCPerBitingMidge4.mat');
I = (VC4.VC > -1);
VC(I) = VC4.VC(I);
I = isnan(VC4.VC);
VC(I) = VC4.VC(I);
clearvars VC4
%%

VC5 = load('VCPerBitingMidge5.mat');
I = (VC5.VC > -1);
VC(I) = VC5.VC(I);
I = isnan(VC5.VC);
VC(I) = VC5.VC(I);
clearvars VC5
%%

VC6 = load('VCPerBitingMidge6.mat');
I = (VC6.VC > -1);
VC(I) = VC6.VC(I);
I = isnan(VC6.VC);
VC(I) = VC6.VC(I);
clearvars VC6
%%