% �����¶ȶ�����ƽ������
% Created by WANG Xuehua
%���ݴ�1891/01��ʼ ������
clc;clear;
%��ȡnc�ļ�
name=['D:\������ԭʼ����\�¶�����\sst.mon.mean.nc'];
time=ncread(name,'time');
tlon=ncread(name,'lon');
tlat=ncread(name,'lat');
sst=ncread(name,'sst');
sst(find(sst>100))=NaN;
i1=(2002-1891)*12+1;
i2=(2020-1891)*12+1;
for i=1:12   %��ȡ�����µ��ζ�����
    temp_sum=sst(:,:,[i1+i-1:12:i2]);%�����ܺ�
    temp_avg(:,:,i)=nanmean(temp_sum,3);  %��������ͬ�·ݵ�Ҷ�������ݽ���ƽ��
end
save('D:\�������м����ɵ�����\monthtemp.mat','tlon','tlat','temp_avg');


