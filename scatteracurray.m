%模型精度衡量（36308训练+9076测试）、散点图
%Created by Wang Xuehua
clc;clear
%处理自变量和因变量数据
load('D:\课程\海洋数据可视化实习\中间生成的数据\dataforscatter.mat');
data=[T_test',Regress_Pred',MeSAA_Pred',GRNN_Pred',RFRE_Pred'];
xlabeltxt={'实测pCO2/μatm'};%坐标轴名称
titletxt={'多元线性回归','MeSAA','GRNN','RFRE'};
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
    xlabel('实测pCO_{2}/μatm');
    ylabel('反演pCO_{2}/μatm');
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
c.Label.String = 'log_{10}(离岸距离)/Km';
c.Label.FontSize = 12;
ax.Visible = 'off';
