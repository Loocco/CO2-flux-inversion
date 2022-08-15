% ȷ�����������������ϵ��(fig7)
% Created by Wang Xuehua 
subplot(2,1,1)
step=[3 5125 19389 30793 30932 31498 33962 37592 44754 52721 61103 61534 68098 69216 85628,...
    86151 86388 87061 87453 87491 87800 87899 88072 88684 88829 89687 89692 89752 89900,...
    90238 90346 90512 91011 91228 91861 92038 92226 92449 92566 95503 96034 96473] %������ֹ����
i=20; %ѭ����ȡ���ҳ���chl����pCO2����
load D:\�����麣�����ݴ�������ӻ�����\�����ĵ�\Data\�м����ɵ�����\trajdata.mat
load D:\�����麣�����ݴ�������ӻ�����\�����ĵ�\Data\�м����ɵ�����\chltotraj.mat
x=chl(step(i):step(i+1));pCO2=pCO2(step(i):step(i+1));
n=find(isnan(x));
x(:,n)=[];x=log10(x);x=x';
pCO2(n,:)=[];
scatter(x,pCO2,25,'filled');
xlabel('lg(chla)/mg��m^-^3');
ylabel('pCO_2/��atm');
hold on
p=polyfit(x,pCO2,1); %б��
f1 = polyval(p,x);
plot(x,f1,'k','linewidth',1.5);
txt=['k= ',num2str(p(1))]
text(-1.17,380,txt,'FontSize',13)
text(-1.257,383,'(a)','fontweight','bold')
box on
%�����ں���ϸ��ͼ
subplot(2,1,2)
% m_proj('oblique mercator');%ȷ��ͶӰ��ʽ�ͻ�ͼ����
m_proj('equidist', 'longitudes', [25,75], 'latitudes', [-40, -15], 'aspect', 0.5);
% m_proj('equidist', 'longitudes', [50,130], 'latitudes', [-30, -15], 'aspect', 0.5);
m_coast('patch', [.7 .7 .7])
m_coast('linewidth', 1, 'color', 'b');%����������
m_grid;%��Ӹ���
hold on
chl=chl';
m_scatter(lon(step(i):1:step(i+1),1),lat(step(i):1:step(i+1),1),30,chl(step(i):1:step(i+1),1),'filled'); %filled��ʾ����ʵ�ĵ㣬ȱʡ��Ϊ���ĵ�
xlabel('����')
ylabel('γ��')
grid on
h = colorbar;
% caxis([350,420])
set(get(h,'label'),'string','chla/mg��m^-3');%����ɫ������
xli=xlim
yli=ylim
text(xli(1)+0.01,yli(2)-0.04,'(b)','fontweight','bold')

