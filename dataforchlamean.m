%����Ҷ���ض�����ƽ������
%ע�⣬���ɵ�chlaΪlg(chla)
%Created by Wang Xuehua
clc;clear;
for i=1:12   %��ȡ�����µ�Ҷ��������
    n=0;
    for j=2002:2020
        n=n+1;
        name=['D:\������ԭʼ����\Ҷ����������\',num2str(j),'-',num2str(i),'.nc'];
        if j==2002 && i<8  %���ݴ�2002��8�¿�ʼ
            continue
        end
        chla=ncread(name,'chlor_a');%��ȡ����
        chla(find(chla==-32767))=nanmean(chla(:));
        clon=ncread(name,'lon');
        clat=ncread(name,'lat');
        chla_sum(:,:,n)=chla;%�����ܺ�
    end
    chla_avg(:,:,i)=nanmean(chla_sum,3);  %��������ͬ�·ݵ�Ҷ�������ݽ���ƽ��
end
save('D:\�������м����ɵ�����\monthchla.mat','clon','clat','chla_avg');