%������ ��45384
%Created by Wang Xuehua
clc;clear
%1.��������
load('D:\�γ�\�������ݿ��ӻ�ʵϰ\�м����ɵ�����\dataformodel.mat');
set(gcf,'Position',[100 50 1000 500]);
% Data distribution by time
subplot(1,3,1)
hold on
edges=datenum([[2002:2020]' ones(19,1) ones(19,1)]);
histogram(datenum(year_train,2,1),edges);
histogram(datenum(year_test,2,1),edges);
legend({'ѵ����','���Լ�' })
datetick('x'); xlim([datenum([2002 1 1]) datenum([2021 1 1])]);
xli=xlim;
yli=ylim;
text(xli(1)+0.05*(xli(2)-xli(1)),yli(1)+0.95*(yli(2)-yli(1)),'(a)');
box on
xlabel('���');
ylabel('������');

% Data distribution by latitude
subplot(1,3,2)
 hold on;
edges=[-30:5:30];
histogram(lat_train,edges);
histogram(lat_test,edges);
legend({'ѵ����','���Լ�' });
xli=xlim;
yli=ylim;
text(xli(1)+0.05*(xli(2)-xli(1)),yli(1)+0.95*(yli(2)-yli(1)),'(b)');
box on
xlabel('γ��');
ylabel('������');

% Data distribution by longitude
subplot(1,3,3)
 hold on;
edges=[15:5:130];
histogram(lon_train,edges);
histogram(lon_test,edges);
legend({'ѵ����','���Լ�' });
xli=xlim;
yli=ylim;
text(xli(1)+0.05*(xli(2)-xli(1)),yli(1)+0.95*(yli(2)-yli(1)),'(c)');
box on
xlabel('����');
ylabel('������');
