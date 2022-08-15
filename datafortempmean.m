% 生成温度多年月平均数据
% Created by WANG Xuehua
%数据从1891/01开始 月数据
clc;clear;
%读取nc文件
name=['D:\第五组原始数据\温度数据\sst.mon.mean.nc'];
time=ncread(name,'time');
tlon=ncread(name,'lon');
tlat=ncread(name,'lat');
sst=ncread(name,'sst');
sst(find(sst>100))=NaN;
i1=(2002-1891)*12+1;
i2=(2020-1891)*12+1;
for i=1:12   %读取各年月的盐度数据
    temp_sum=sst(:,:,[i1+i-1:12:i2]);%多年总和
    temp_avg(:,:,i)=nanmean(temp_sum,3);  %将各年相同月份的叶绿素数据进行平均
end
save('D:\第五组中间生成得数据\monthtemp.mat','tlon','tlat','temp_avg');


