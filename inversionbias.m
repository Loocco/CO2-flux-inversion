% pCO2����
% Created by Wang Xuehua
% clc;clear
load('D:\�γ�\�������ݿ��ӻ�ʵϰ\�м����ɵ�����\dataforinversion')
lon=30:0.25:129;lat=-30:0.25:27;% ���¶ȡ��ζȡ�Ҷ�������ݲ�ֵ����������
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
%     Mp(find(isnan(canzhao)==1))=NaN;%���½��
    hold on
    m_proj('equidist', 'longitudes', [30,129], 'latitudes', [-30, 27], 'aspect', 0.5);
    m_pcolor(xq,yq,real(Mp)');  %��ͼ
    m_coast('patch', [.7 .7 .7])
    m_coast('linewidth', 1, 'color', 'b');%����������
    m_grid('box','fancy');%��Ӹ���
    %     shading flat;
    %     colormap(parula);
    h = colorbar;
    caxis([-400 100])
    set(get(h,'label'),'string','\deltapCO_{2}/��atm');%����ɫ������
    title([num2str(j),'��ƽ����RFRE-MeSAA������pCO_{2}']);
    xlabel('����','FontWeight','bold')
    ylabel('γ��','FontWeight','bold')
end