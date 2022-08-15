%数据量 共45384
%Created by Wang Xuehua
clc;clear
%1.产生数据
load('D:\课程\海洋数据可视化实习\中间生成的数据\dataformodel.mat');
set(gcf,'Position',[100 50 1000 500]);
% Data distribution by time
subplot(1,3,1)
hold on
edges=datenum([[2002:2020]' ones(19,1) ones(19,1)]);
histogram(datenum(year_train,2,1),edges);
histogram(datenum(year_test,2,1),edges);
legend({'训练集','测试集' })
datetick('x'); xlim([datenum([2002 1 1]) datenum([2021 1 1])]);
xli=xlim;
yli=ylim;
text(xli(1)+0.05*(xli(2)-xli(1)),yli(1)+0.95*(yli(2)-yli(1)),'(a)');
box on
xlabel('年份');
ylabel('数据量');

% Data distribution by latitude
subplot(1,3,2)
 hold on;
edges=[-30:5:30];
histogram(lat_train,edges);
histogram(lat_test,edges);
legend({'训练集','测试集' });
xli=xlim;
yli=ylim;
text(xli(1)+0.05*(xli(2)-xli(1)),yli(1)+0.95*(yli(2)-yli(1)),'(b)');
box on
xlabel('纬度');
ylabel('数据量');

% Data distribution by longitude
subplot(1,3,3)
 hold on;
edges=[15:5:130];
histogram(lon_train,edges);
histogram(lon_test,edges);
legend({'训练集','测试集' });
xli=xlim;
yli=ylim;
text(xli(1)+0.05*(xli(2)-xli(1)),yli(1)+0.95*(yli(2)-yli(1)),'(c)');
box on
xlabel('经度');
ylabel('数据量');
