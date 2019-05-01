%% Plot for mean R values

figure(4)
clf
EURLong = double(Long(FLong));
EURLat = double(Lat(FLat));

DNBase = datenum([1999,12,31]);

% map = [0.7 0.7 0.7;jet(49)];


%%
 map = [0.7 0.7 0.7;jet(99)];
colormap(map)
%%

subplot(3,3,1)

ValidDays = [];
for years = 2000:2005
    DN0 = datenum([years,3,1]);
    DN1 = datenum([years,6,1])-1;
    ValidDays = [ValidDays,DN0:DN1];
end
    ValidDays = ValidDays-DNBase;

R = nanmean(PercFarmsRGreaterThanOne(:,:,ValidDays),3);
contourf(EURLong,EURLat,R,50,'LineStyle','none')
hold on

hold off
    colorbar
    
    caxis([0,1])  
    set(gca,'FontSize',16);
    xlabel('Longitude','FontSize',30); 
    ylabel('Latitude','FontSize',30);
     title('2000 - 2005','FontSize',40)
    dim = [.2 .6 .3 .3];
    h1 = text(-30,36.5,'March-May');
    set(h1,'rotation',90,'FontSize',40,'FontWeight','bold')
  %%
    subplot(3,3,4)

ValidDays = [];
for years = 2000:2005
    DN0 = datenum([years,6,1]);
    DN1 = datenum([years,9,1])-1;
    ValidDays = [ValidDays,DN0:DN1];
end
    ValidDays = ValidDays-DNBase;

R = nanmean(PercFarmsRGreaterThanOne(:,:,ValidDays),3);
contourf(EURLong,EURLat,R,50,'LineStyle','none')
hold on

hold off
    colorbar
    caxis([0,1])  
    set(gca,'FontSize',16);
    xlabel('Longitude','FontSize',30); 
    ylabel('Latitude','FontSize',30);
 %    title('2000 - 2005','FontSize',40)
    dim = [.2 .6 .3 .3];
    h1 = text(-30,37.5,'June-Aug');
    set(h1,'rotation',90,'FontSize',40,'FontWeight','bold')
    
      %%
    subplot(3,3,7)

ValidDays = [];
for years = 2000:2005
    DN0 = datenum([years,9,1]);
    DN1 = datenum([years,12,1])-1;
    ValidDays = [ValidDays,DN0:DN1];
end
    ValidDays = ValidDays-DNBase;

R = nanmean(PercFarmsRGreaterThanOne(:,:,ValidDays),3);
contourf(EURLong,EURLat,R,50,'LineStyle','none')
hold on

hold off
colorbar
    caxis([0,1])  
    set(gca,'FontSize',16);
    xlabel('Longitude','FontSize',30); 
    ylabel('Latitude','FontSize',30);
 %    title('2000 - 2005','FontSize',40)
    dim = [.2 .6 .3 .3];
    h1 = text(-30,37.5,'Sept-Nov');
    set(h1,'rotation',90,'FontSize',40,'FontWeight','bold')
          %%
 subplot(3,3,2)

ValidDays = [];
for years = 2006:2010
    DN0 = datenum([years,3,1]);
    DN1 = datenum([years,6,1])-1;
    ValidDays = [ValidDays,DN0:DN1];
end
    ValidDays = ValidDays-DNBase;

R = nanmean(PercFarmsRGreaterThanOne(:,:,ValidDays),3);
contourf(EURLong,EURLat,R,50,'LineStyle','none')
hold on

hold off
    colorbar
    
    caxis([0,1])  
    set(gca,'FontSize',16);
    xlabel('Longitude','FontSize',30); 
    ylabel('Latitude','FontSize',30);
     title('2006 - 2010','FontSize',40)
    dim = [.2 .6 .3 .3];
  %  h1 = text(-30,37.5,'March-May');
%    set(h1,'rotation',90,'FontSize',40,'FontWeight','bold')
      %%
    subplot(3,3,5)

ValidDays = [];
for years = 2006:2010
    DN0 = datenum([years,6,1]);
    DN1 = datenum([years,9,1])-1;
    ValidDays = [ValidDays,DN0:DN1];
end
    ValidDays = ValidDays-DNBase;

R = nanmean(PercFarmsRGreaterThanOne(:,:,ValidDays),3);
contourf(EURLong,EURLat,R,50,'LineStyle','none')
hold on

hold off
    colorbar
    caxis([0,1])  
    set(gca,'FontSize',16);
    xlabel('Longitude','FontSize',30); 
    ylabel('Latitude','FontSize',30);
 %    title('2000 - 2005','FontSize',40)
    dim = [.2 .6 .3 .3];
%     h1 = text(-30,37.5,'June-Aug');
%     set(h1,'rotation',90,'FontSize',40,'FontWeight','bold')

      %%
    subplot(3,3,8)

ValidDays = [];
for years = 2006:2010
    DN0 = datenum([years,9,1]);
    DN1 = datenum([years,12,1])-1;
    ValidDays = [ValidDays,DN0:DN1];
end
    ValidDays = ValidDays-DNBase;

R = nanmean(PercFarmsRGreaterThanOne(:,:,ValidDays),3);
contourf(EURLong,EURLat,R,50,'LineStyle','none')
hold on

hold off
colorbar
    caxis([0,1])  
    set(gca,'FontSize',16);
    xlabel('Longitude','FontSize',30); 
    ylabel('Latitude','FontSize',30);
 %    title('2000 - 2005','FontSize',40)
%%
subplot(3,3,3)

ValidDays = [];
for years = 2011:2015
    DN0 = datenum([years,3,1]);
    DN1 = datenum([years,6,1])-1;
    ValidDays = [ValidDays,DN0:DN1];
end
    ValidDays = ValidDays-DNBase;

R = nanmean(PercFarmsRGreaterThanOne(:,:,ValidDays),3);
contourf(EURLong,EURLat,R,50,'LineStyle','none')
hold on

hold off
    colorbar
    
    caxis([0,1])  
    set(gca,'FontSize',16);
    xlabel('Longitude','FontSize',30); 
    ylabel('Latitude','FontSize',30);
     title('2011 - 2015','FontSize',40)
    dim = [.2 .6 .3 .3];
    
          %%
    subplot(3,3,6)

ValidDays = [];
for years = 2011:2015
    DN0 = datenum([years,8,1]);
    DN1 = datenum([years,9,1])-1;
    ValidDays = [ValidDays,DN0:DN1];
end
    ValidDays = ValidDays-DNBase;
%%
ValidDays = intersect(ValidDays,1:5714);
R = nanmean(PercFarmsRGreaterThanOne(:,:,ValidDays),3);
%%
contourf(EURLong,EURLat,R,50,'LineStyle','none')
hold on
%%
hold off
    colorbar
    caxis([0,1])  
    set(gca,'FontSize',16);
    xlabel('Longitude','FontSize',30); 
    ylabel('Latitude','FontSize',30);
 %    title('2000 - 2005','FontSize',40)
    dim = [.2 .6 .3 .3];
%     h1 = text(-30,37.5,'June-Aug');
%     set(h1,'rotation',90,'FontSize',40,'FontWeight','bold')
          %%
    subplot(3,3,9)

ValidDays = [];
for years = 2011:2015
    DN0 = datenum([years,9,1]);
    DN1 = datenum([years,12,1])-1;
    ValidDays = [ValidDays,DN0:DN1];
end
    ValidDays = ValidDays-DNBase;
ValidDays = intersect(ValidDays,1:5714);

R = nanmean(PercFarmsRGreaterThanOne(:,:,ValidDays),3);
contourf(EURLong,EURLat,R,50,'LineStyle','none')
hold on

hold off
    colorbar
    caxis([0,1])  
    set(gca,'FontSize',16);
    xlabel('Longitude','FontSize',30); 
    ylabel('Latitude','FontSize',30);
 %    title('2000 - 2005','FontSize',40)
    dim = [.2 .6 .3 .3];
%     h1 = text(-30,37.5,'June-Aug');
%     set(h1,'rotation',90,'FontSize',40,'FontWeight','bold')
  %%
% x = linspace(0,1,100);
% y = 1-x;
% GreyToBlueScale = ([0.7 0.7 0.7]'*y)' + ([0 0 1]'*x)';
% x = linspace(0,1,200);
% y = 1-x;
% GreenToYellowScale = ([0 0.5 0.5]'*y)' + ([1 1 0]'*x)';
% 
% 
%   map = [GreyToBlueScale;GreenToYellowScale];
% colormap(map)

   