%生成叶绿素多年月平均数据
%注意，生成得chla为lg(chla)
%Created by Wang Xuehua
clc;clear;
for i=1:12   %读取各年月的叶绿素数据
    n=0;
    for j=2002:2020
        n=n+1;
        name=['D:\第五组原始数据\叶绿素月数据\',num2str(j),'-',num2str(i),'.nc'];
        if j==2002 && i<8  %数据从2002年8月开始
            continue
        end
        chla=ncread(name,'chlor_a');%读取数据
        chla(find(chla==-32767))=nanmean(chla(:));
        clon=ncread(name,'lon');
        clat=ncread(name,'lat');
        chla_sum(:,:,n)=chla;%多年总和
    end
    chla_avg(:,:,i)=nanmean(chla_sum,3);  %将各年相同月份的叶绿素数据进行平均
end
save('D:\第五组中间生成得数据\monthchla.mat','clon','clat','chla_avg');