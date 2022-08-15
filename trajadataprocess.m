%����������ͼ ����������pCO2���¶ȡ��ζ�(fig1)
%created by WANG Xuehua 2022/04
clc;clear
boundary =[15 130 -40 28];
%�ļ�������������
source1 = "D:\������ԭʼ����\�ߺ�ʵ������\fCO2traja.csv";  %��Դ�ļ���SOCATv2021
data = xlsread(source1);
lon = data(:,4);  %���ľ�����Ϣ
lat = data(:,3);  %����γ������
T = data(:,16);   %�¶�
sal = data(:,15); %�ζ�
P = data(:,18)*100;%����ѹǿ
fCO2 = data(:,25);%������̼�ݶ�
%fCO2תpCO2
absT = data(:,16)+273.15; %�����¶�
fa = (57.7-0.118*absT).*0.000001;
R = 8.314;
B = (-1636.75+12.040.*absT-3.27957.*absT.*absT*0.01+3.16528.*absT.*absT.*absT.*0.00001)*0.000001;
pCO2 = fCO2./exp(P.*(B+2.*fa)./(R.*absT));
% ��ͼ
x=[pCO2 sal T];
caxisrange={[300 450] [31 36] [20 32]};
hlabel={'pCO_{2}/��atm' '�ζ�/psu' '�¶�/��'};
str={'(a)','(b)','(c)','(d)'};
c=0;
figure
set(gcf,'Position',[100 50 1000 500])

top_margin = 0.03; % top margin
btm_margin = 0.1; % bottom margin
left_margin = 0.05;% left margin
right_margin = 0.05;% right margin
 
fig_margin = 0.1; % margin beween figures(sub) 
row = 2; % rows
col = 2; % cols
fig_h = (1- top_margin - btm_margin - (row-1) * fig_margin) / row;
fig_w = (1 - left_margin - right_margin - (col-1) * fig_margin) / col;
for i = 1 : row
    for j = 1 : col %���ߡ�pCO2���ζȡ��¶�
        position = [left_margin + (j-1)*(fig_margin+fig_w), ...
            1- (top_margin + i * fig_h + (i-1) * fig_margin), ...
            fig_w, fig_h]
        c=c+1;
        subplot(2,2,c,'position', position)
        m_proj('equidist', 'longitudes', [15,130], 'latitudes', [-40, 28], 'aspect', 0.5);
        m_coast('patch', [.7 .7 .7])
        m_coast('linewidth', 1, 'color', 'b');%����������
        m_grid;%��Ӹ���
        hold on
        if c==1
            m_scatter(lon(1:1:247345,1),lat(1:1:247345,1),5,'filled'); %filled��ʾ����ʵ�ĵ㣬ȱʡ��Ϊ���ĵ�
            cbar1 = colorbar;
            set(cbar1, 'Visible', 'off')
        else
            m_scatter(lon(1:1:247345,1),lat(1:1:247345,1),5,x(1:1:247345,c-1),'filled'); %filled��ʾ����ʵ�ĵ㣬ȱʡ��Ϊ���ĵ�
            caxis(caxisrange{c-1})
            h = colorbar;
            set(get(h,'label'),'string',hlabel{c-1});%����ɫ������
        end
        xlabel('����','FontWeight','bold')
        ylabel('γ��','FontWeight','bold')
        grid on
        xli=xlim;yli=ylim;
        text(xli(1)+0.05,yli(2)-0.05,0.25,str{c},'FontSize',10,'FontWeight','bold')
    end
end
save('D:\�������м����ɵ�����\trajdata.mat','data','lon','lat','pCO2','sal','T','day','month','P','year');