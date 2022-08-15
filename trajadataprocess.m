%画航线数据图 包括航迹、pCO2、温度、盐度(fig1)
%created by WANG Xuehua 2022/04
clc;clear
boundary =[15 130 -40 28];
%文件打开与数据载入
source1 = "D:\第五组原始数据\走航实测数据\fCO2traja.csv";  %打开源文件，SOCATv2021
data = xlsread(source1);
lon = data(:,4);  %查阅经度信息
lat = data(:,3);  %查阅纬度资料
T = data(:,16);   %温度
sal = data(:,15); %盐度
P = data(:,18)*100;%海表压强
fCO2 = data(:,25);%二氧化碳逸度
%fCO2转pCO2
absT = data(:,16)+273.15; %绝对温度
fa = (57.7-0.118*absT).*0.000001;
R = 8.314;
B = (-1636.75+12.040.*absT-3.27957.*absT.*absT*0.01+3.16528.*absT.*absT.*absT.*0.00001)*0.000001;
pCO2 = fCO2./exp(P.*(B+2.*fa)./(R.*absT));
% 画图
x=[pCO2 sal T];
caxisrange={[300 450] [31 36] [20 32]};
hlabel={'pCO_{2}/μatm' '盐度/psu' '温度/℃'};
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
    for j = 1 : col %航线、pCO2、盐度、温度
        position = [left_margin + (j-1)*(fig_margin+fig_w), ...
            1- (top_margin + i * fig_h + (i-1) * fig_margin), ...
            fig_w, fig_h]
        c=c+1;
        subplot(2,2,c,'position', position)
        m_proj('equidist', 'longitudes', [15,130], 'latitudes', [-40, 28], 'aspect', 0.5);
        m_coast('patch', [.7 .7 .7])
        m_coast('linewidth', 1, 'color', 'b');%画出海岸线
        m_grid;%添加格网
        hold on
        if c==1
            m_scatter(lon(1:1:247345,1),lat(1:1:247345,1),5,'filled'); %filled表示点是实心点，缺省则为空心点
            cbar1 = colorbar;
            set(cbar1, 'Visible', 'off')
        else
            m_scatter(lon(1:1:247345,1),lat(1:1:247345,1),5,x(1:1:247345,c-1),'filled'); %filled表示点是实心点，缺省则为空心点
            caxis(caxisrange{c-1})
            h = colorbar;
            set(get(h,'label'),'string',hlabel{c-1});%给颜色栏命名
        end
        xlabel('经度','FontWeight','bold')
        ylabel('纬度','FontWeight','bold')
        grid on
        xli=xlim;yli=ylim;
        text(xli(1)+0.05,yli(2)-0.05,0.25,str{c},'FontSize',10,'FontWeight','bold')
    end
end
save('D:\第五组中间生成得数据\trajdata.mat','data','lon','lat','pCO2','sal','T','day','month','P','year');