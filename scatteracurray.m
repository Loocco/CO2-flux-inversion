%ģ�;��Ⱥ�����36308ѵ��+9076���ԣ���ɢ��ͼ
%Created by Wang Xuehua
clc;clear
%�����Ա��������������
load('D:\�γ�\�������ݿ��ӻ�ʵϰ\�м����ɵ�����\dataforscatter.mat');
data=[T_test',Regress_Pred',MeSAA_Pred',GRNN_Pred',RFRE_Pred'];
xlabeltxt={'ʵ��pCO2/��atm'};%����������
titletxt={'��Ԫ���Իع�','MeSAA','GRNN','RFRE'};
tizhutxt={'(a)','(b)','(c)','(d)'};
set(gcf,'Position',[100 50 1000 500]);
YReal=data(:,1);
for var=1:4
    YPred=data(:,var+1);  
    subplot(2,2,var)    
    rmse = sqrt(mean((YPred-YReal).^2));
    r2 = 1 - (sum((YPred - YReal).^2) / sum((YReal - mean(YReal)).^2));
    a=[300,600];
    bb=a;
    plot(a,bb,'k','linewidth',2);
    hold on
    scatter(YReal,YPred,7,log10(dtl_test),'filled');
    hold on
    ylim([300 600]);
    xlim([300 600]);
    xli=xlim
    xlabel('ʵ��pCO_{2}/��atm');
    ylabel('����pCO_{2}/��atm');
    string=['RMSE=',num2str(rmse,'%2f')]
    text(490,330,string,'FontSize',10);
    text(0.03*(xli(2)-xli(1))+xli(1),570,tizhutxt{var});
    title(titletxt(var))
    box on
    grid on
end
c=colorbar;
caxis([1 3]);
colormap(cmocean('haline'));
c.Label.String = 'log_{10}(�밶����)/Km';
c.Label.FontSize = 12;
ax.Visible = 'off';
