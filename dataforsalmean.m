% �����ζȶ�����ƽ������
% Created by WANGXuehua
clc;clear;
%��ȡnc�ļ�
for i=1:12   %��ȡ�����µ��ζ�����
    n=0;
    for j=2002:2020
       n=n+1;
       name=['D:\������ԭʼ����\�ζ�����\CZ16_1_2000m_salinity_year_',num2str(j),'_month_',num2str(i,'%02d'),'.nc'];     
       sal0=ncread(name,'salinity');%��ȡ����
       sal=squeeze(sal0(1,:,:));
       sal(find(sal==-999))=nanmean(sal(:));%��Ч����
       slon=ncread(name,'lon');
       slat=ncread(name,'lat');
       sal_sum(:,:,n)=sal;%�����ܺ�
    end
    sal_avg(:,:,i)=nanmean(sal_sum,3);  %��������ͬ�·ݵ�Ҷ�������ݽ���ƽ��
end
save('D:\�������м����ɵ�����\monthsal.mat','slon','slat','sal_avg');