% 生成盐度多年月平均数据
% Created by WANGXuehua
clc;clear;
%读取nc文件
for i=1:12   %读取各年月的盐度数据
    n=0;
    for j=2002:2020
       n=n+1;
       name=['D:\第五组原始数据\盐度数据\CZ16_1_2000m_salinity_year_',num2str(j),'_month_',num2str(i,'%02d'),'.nc'];     
       sal0=ncread(name,'salinity');%读取数据
       sal=squeeze(sal0(1,:,:));
       sal(find(sal==-999))=nanmean(sal(:));%无效数据
       slon=ncread(name,'lon');
       slat=ncread(name,'lat');
       sal_sum(:,:,n)=sal;%多年总和
    end
    sal_avg(:,:,i)=nanmean(sal_sum,3);  %将各年相同月份的叶绿素数据进行平均
end
save('D:\第五组中间生成得数据\monthsal.mat','slon','slat','sal_avg');