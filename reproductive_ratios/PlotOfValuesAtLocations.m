%Plot of average R at locations rather than latitude
% load('CombinedR0_05.mat')
% load('CombinedR0_median.mat')
% load('CombinedR0_95.mat')
% load('TotalAnimalDensity.mat')
% CombinedR0_05 = sqrt(CombinedR0_05);
% CombinedR0_median = sqrt(CombinedR0_median);
% CombinedR0_95 = sqrt(CombinedR0_95);
%%

%93/94 is Euro Lat for sweden
RSweden = permute(nanmean(nanmean(CombinedR0_median(93:94,104,:),2),1),[3 1 2]);
%68 is Euro Lat for Netherlands
RNetherlands = permute(nanmean(CombinedR0_median(68,65,:),1),[3 1 2]);
%32 is Euro Lat for Netherlands
RItaly =  permute(nanmean(CombinedR0_median(32,97,:),1),[3 1 2]);

%%
%93/94 is Euro Lat for sweden
RSweden0_05 = permute(nanmean(nanmean(CombinedR0_05(93:94,104,:),2),1),[3 1 2]);
%68 is Euro Lat for Netherlands
RNetherlands0_05 = permute(nanmean(CombinedR0_05(68,65,:),1),[3 1 2]);
%32 is Euro Lat for Italy
RItaly0_05 =  permute(nanmean(CombinedR0_05(32,97,:),1),[3 1 2]);

%%
%93/94 is Euro Lat for sweden
RSweden0_95 = permute(nanmean(nanmean(CombinedR0_95(93:94,104,:),2),1),[3 1 2]);
%68 is Euro Lat for Netherlands
RNetherlands0_95 = permute(nanmean(CombinedR0_95(68,65,:),1),[3 1 2]);
%32 is Euro Lat for Italu
RItaly0_95 =  permute(nanmean(CombinedR0_95(32,97,:),1),[3 1 2]);


%% Calculate averages for years and across years

MeanBetweenYearsSweden = zeros(16,3);
MeanBetweenYearsNetherlands = zeros(16,3);
MeanBetweenYearsItaly = zeros(16,3);

MeanOverYearsSweden = zeros(16,275);
MeanOverYearsNetherlands = zeros(16,275);
MeanOverYearsItaly = zeros(16,275);

DNBase = datenum([1999,12,31]);
for year = 2000:2015
    DN0 = datenum([year,3,1]);
    DN1 = datenum([year,11,30]);
    ValidDays = (DN0:DN1) - DNBase;
    %Get summary statistics
    MeanBetweenYearsSweden(year-1999,1) = year;
    MeanBetweenYearsSweden(year-1999,2) = nanmean(RSweden(ValidDays));
    MeanBetweenYearsSweden(year-1999,3) = max(RSweden(ValidDays));
    
    MeanBetweenYearsNetherlands(year-1999,1) = year;
    MeanBetweenYearsNetherlands(year-1999,2) = nanmean(RNetherlands(ValidDays));
    MeanBetweenYearsNetherlands(year-1999,3) = max(RNetherlands(ValidDays));
    
    MeanBetweenYearsItaly(year-1999,1) = year;
    MeanBetweenYearsItaly(year-1999,2) = nanmean(RItaly(ValidDays));
    MeanBetweenYearsItaly(year-1999,3) = max(RItaly(ValidDays));
    %Get Years
    
    MeanOverYearsSweden(year-1999,:) = RSweden(ValidDays);
    MeanOverYearsNetherlands(year-1999,:) = RNetherlands(ValidDays);
    MeanOverYearsItaly(year-1999,:) = RItaly(ValidDays);
    
    MeanOverYearsSweden0_05(year-1999,:) = RSweden0_05(ValidDays);
    MeanOverYearsNetherlands0_05(year-1999,:) = RNetherlands0_05(ValidDays);
    MeanOverYearsItaly0_05(year-1999,:) = RItaly0_05(ValidDays);
    
    MeanOverYearsSweden0_95(year-1999,:) = RSweden0_95(ValidDays);
    MeanOverYearsNetherlands0_95(year-1999,:) = RNetherlands0_95(ValidDays);
    MeanOverYearsItaly0_95(year-1999,:) = RItaly0_95(ValidDays);
end

%%
figure(2)
clf

%%
%Sweden plots
subplot(3,2,2)

bar(MeanBetweenYearsSweden(:,1),MeanBetweenYearsSweden(:,2),'FaceColor',[0.6 0.6 0.6])
hold on
stem(MeanBetweenYearsSweden(:,1),MeanBetweenYearsSweden(:,3),'LineWidth',2,'MarkerSize',10)
hold off
l1 = legend('Mean R_0, median-risk farm','Max R_0, median-risk farm');
xlim([1999.5,2015.5])
ylim([0,9])
set(gca,'FontSize',20)
set(l1,'FontSize',15)
ylabel('Reproductive ratio (yearly)')



subplot(3,2,1)

%Plot averages
plot(nanmean(MeanOverYearsSweden0_95,1),'Color',[1 0 0],'LineWidth',3);hold on
plot(nanmean(MeanOverYearsSweden,1),'Color',[0 0 0],'LineWidth',3);
plot(nanmean(MeanOverYearsSweden0_05,1),'Color',[0 0 1],'LineWidth',3)
%Plot realisations
plot(MeanOverYearsSweden','Color',[0.8 0.8 0.8])
plot(MeanOverYearsSweden0_05','Color',[0.8 0.8 1])
plot(MeanOverYearsSweden0_95','Color',[1 0.8 0.8])
%And overlay averages again
plot(nanmean(MeanOverYearsSweden,1),'Color',[0 0 0],'LineWidth',3)
plot(nanmean(MeanOverYearsSweden0_05,1),'Color',[0 0 1],'LineWidth',3)
plot(nanmean(MeanOverYearsSweden0_95,1),'Color',[1 0 0],'LineWidth',3)
% Insert R0 = 1 line
plot([0,275],[1 1],':','Color',[0.8 0.3 0.1],'LineWidth',2)
legend('High-risk farm','Median-risk farm','Low-risk farm','Location','northwest')

set(gca,'XTick',[31,92,153,214,275],'XTickLabel',{'April','June','Aug','Oct','Dec'},'FontSize',20)
ylim([0,25])
ylabel('Reproductive ratio (daily)')

h1 = text(-60,3,'Sweden');
set(h1,'rotation',90,'FontSize',40,'FontWeight','bold')

%Add inset map
axes('Position',[0.375 0.85 .08 .065])
map = [1 1 1;0.7 0.7 0.7;0.7 0.7 0.7];
colormap(map)
image((Density >= 0) + 1)
hold on
plot(3193,1513,'.','MarkerSize',30,'Color',[1 0 0])
set(gca,'XTick',[],'Ytick',[])
%%
%Netherlands plots
subplot(3,2,4)

bar(MeanBetweenYearsNetherlands(:,1),MeanBetweenYearsNetherlands(:,2),'FaceColor',[0.6 0.6 0.6])
hold on
stem(MeanBetweenYearsNetherlands(:,1),MeanBetweenYearsNetherlands(:,3),'LineWidth',2,'MarkerSize',10)
hold off
% l2 = legend('Mean R, median farm','Max R, median farm ');
xlim([1999.5,2015.5])
ylim([0,9])
set(gca,'FontSize',20)
% set(l2,'FontSize',15)
ylabel('Reproductive ratio (yearly)')


subplot(3,2,3)
%Plot averages
plot(nanmean(MeanOverYearsNetherlands0_95,1),'Color',[1 0 0],'LineWidth',3);hold on
plot(nanmean(MeanOverYearsNetherlands,1),'Color',[0 0 0],'LineWidth',3);
plot(nanmean(MeanOverYearsNetherlands0_05,1),'Color',[0 0 1],'LineWidth',3)
%Plot realisations
plot(MeanOverYearsNetherlands','Color',[0.8 0.8 0.8])
plot(MeanOverYearsNetherlands0_05','Color',[0.8 0.8 1])
plot(MeanOverYearsNetherlands0_95','Color',[1 0.8 0.8])
%And overlay averages again
plot(nanmean(MeanOverYearsNetherlands,1),'Color',[0 0 0],'LineWidth',3)
plot(nanmean(MeanOverYearsNetherlands0_05,1),'Color',[0 0 1],'LineWidth',3)
plot(nanmean(MeanOverYearsNetherlands0_95,1),'Color',[1 0 0],'LineWidth',3)

% legend('95% farm','Median farm','5% farm','Location','northwest')
set(gca,'XTick',[31,92,153,214,275],'XTickLabel',{'April','June','Aug','Oct','Dec'},'FontSize',20)
ylim([0,25])
ylabel('Reproductive ratio (daily)')
% Insert R0 = 1 line
plot([0,275],[1 1],':','Color',[0.8 0.3 0.1],'LineWidth',2)

h2 = text(-60,-5,'The Netherlands');
set(h2,'rotation',90,'FontSize',40,'FontWeight','bold')

%Add inset map
axes('Position',[0.375 0.55 .08 .065])
map = [1 1 1;0.7 0.7 0.7;0.7 0.7 0.7];
colormap(map)
image((Density >= 0) + 1)
hold on
plot(2005,2284,'.','MarkerSize',30,'Color',[1 0 0])

set(gca,'XTick',[],'Ytick',[])
%%
%Italy plots
subplot(3,2,6)

bar(MeanBetweenYearsItaly(:,1),MeanBetweenYearsItaly(:,2),'FaceColor',[0.6 0.6 0.6])
hold on
stem(MeanBetweenYearsItaly(:,1),MeanBetweenYearsItaly(:,3),'LineWidth',2,'MarkerSize',10)
hold off
% l2 = legend('Mean R, median farm','Max R, median farm ');
xlim([1999.5,2015.5])
ylim([0,9])
set(gca,'FontSize',20)
% set(l2,'FontSize',15)
ylabel('Reproductive ratio (yearly)')


subplot(3,2,5)
%Plot averages
plot(nanmean(MeanOverYearsItaly0_95,1),'Color',[1 0 0],'LineWidth',3);hold on
plot(nanmean(MeanOverYearsItaly,1),'Color',[0 0 0],'LineWidth',3);
plot(nanmean(MeanOverYearsItaly0_05,1),'Color',[0 0 1],'LineWidth',3)
%Plot realisations
plot(MeanOverYearsItaly','Color',[0.8 0.8 0.8])
plot(MeanOverYearsItaly0_05','Color',[0.8 0.8 1])
plot(MeanOverYearsItaly0_95','Color',[1 0.8 0.8])
%And overlay averages again
plot(nanmean(MeanOverYearsItaly,1),'Color',[0 0 0],'LineWidth',3)
plot(nanmean(MeanOverYearsItaly0_05,1),'Color',[0 0 1],'LineWidth',3)
plot(nanmean(MeanOverYearsItaly0_95,1),'Color',[1 0 0],'LineWidth',3)

%legend('95% farm','Median farm','5% farm','Location','northwest')
set(gca,'XTick',[31,92,153,214,275],'XTickLabel',{'April','June','Aug','Oct','Dec'},'FontSize',20)
ylim([0,25])
ylabel('Reproductive ratio (daily)')
% Insert R0 = 1 line
plot([0,275],[1 1],':','Color',[0.8 0.3 0.1],'LineWidth',2)

h2 = text(-60,7,'Italy');
set(h2,'rotation',90,'FontSize',40,'FontWeight','bold')



%Add inset map
axes('Position',[0.375 0.25 .08 .065])
map = [1 1 1;0.7 0.7 0.7;0.7 0.7 0.7];
colormap(map)
image((Density >= 0) + 1)
hold on
plot(2983,3373,'.','MarkerSize',30,'Color',[1 0 0])
set(gca,'XTick',[],'Ytick',[])