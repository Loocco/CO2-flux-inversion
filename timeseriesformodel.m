% ʵ�⡢��Ԫ������ϡ�MeSAA��GRNN��RFREʱ������
% Created by Wang Xuehua
clc;clear
%��������
load('D:\�γ�\�������ݿ��ӻ�ʵϰ\�м����ɵ�����\dataforscatter.mat');
C = distinguishable_colors(5);% 4����ɫ
fontsz = 10;
figure; box on;
set(gcf,'color','white');
set(gcf,'unit','normalized','position',[0.02,0.02,0.63,0.40]);
set(gca,'linewidth',2)
hold on
date = datenum(year_test,month_test,day_test);
rawdataplot=[date',Regress_Pred',MeSAA_Pred',T_test',GRNN_Pred',RFRE_Pred'];
dataplot=sort(rawdataplot,1);
date=dataplot(:,1);
pCO2regress=dataplot(:,2);
pCO2MeSAA=dataplot(:,3);
pCO2mearsured=dataplot(:,4);
pCO2GRNN=dataplot(:,5);
pCO2RF=dataplot(:,6);

a=plot(date,pCO2regress,'-o','MarkerFaceColor',C(1, :),'MarkerSize',2,'linewidth',1,'color',C(1, :));%
b=plot(date,pCO2MeSAA,'-s','MarkerFaceColor',C(2, :),'MarkerSize',2,'linewidth',1,'color',C(2, :));%
c=plot(date,pCO2mearsured,'-d','MarkerFaceColor',C(3, :),'MarkerSize',2,'linewidth',1,'color',C(3, :));%
d=plot(date,pCO2GRNN,'-^','MarkerFaceColor',C(4, :),'MarkerSize',2,'linewidth',1,'color',C(4, :));%��
e=plot(date,pCO2RF,'-.','MarkerFaceColor',C(5, :),'MarkerSize',2,'linewidth',1,'color',C(5, :));%��
datetick('x','yyyy');
[l,icons]=legend([c a b d e],{'ʵ��'...
    '��Ԫ���Իع�'...
    'MeSAA'...
    'GRNN'...
    'RFRE'},'location','northeast',...
    'box','off','AutoUpdate','off');
xlim([datenum(2010,1,1) ...
    datenum(2020,1,1)]);
% % 
% ylim([100,450]);
ylabel('{\itp}CO_{2} /\muatm');
xlabel('���');
set(gca,'XTick',[datenum(2010,1,1):365:datenum(2020,1,1)]);
set(gca,'Xticklabel',{'2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020'});
 set(gca,'xgrid','on','gridlinestyle','-','Gridalpha',0.1);