% pCO2反演
% Created by Wang Xuehua
% clc;clear
load('D:\课程\海洋数据可视化实习\中间生成的数据\dataforinversion')
lon=30:0.25:129;lat=-30:0.25:27;% 把温度、盐度、叶绿素数据插值到该网格上
[xq,yq] = meshgrid(lon,lat);
set(gcf,'Position',[100 50 1000 500]);
set(gcf,'color','white');
n=0;
modeledpCO2=RFREoutput-MeSAAoutput;
for j=[1 4 7 10]
    n=n+1
    subplot(2,2,n);
    set(gcf,'color','white');
    Mp(:,:)=modeledpCO2(:,:,n);
%     Mp(find(isnan(canzhao)==1))=NaN;%填充陆地
    hold on
    m_proj('equidist', 'longitudes', [30,129], 'latitudes', [-30, 27], 'aspect', 0.5);
    m_pcolor(xq,yq,real(Mp)');  %绘图
    m_coast('patch', [.7 .7 .7])
    m_coast('linewidth', 1, 'color', 'b');%画出海岸线
    m_grid('box','fancy');%添加格网
    %     shading flat;
    %     colormap(parula);
    h = colorbar;
    caxis([-400 100])
    set(get(h,'label'),'string','\deltapCO_{2}/μatm');%给颜色栏命名
    title([num2str(j),'月平均（RFRE-MeSAA）海表pCO_{2}']);
    xlabel('经度','FontWeight','bold')
    ylabel('纬度','FontWeight','bold')
end