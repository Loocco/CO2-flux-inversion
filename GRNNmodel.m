% GRNNģ��
% Created by Wang Xuehua
clc;clear
%1.�������ݼ�
load('D:\�γ�\�������ݿ��ӻ�ʵϰ\�м����ɵ�����\dataformodel.mat');
load('D:\�γ�\�������ݿ��ӻ�ʵϰ\�м����ɵ�����\dataforpCO2inversion.mat');

%2.ģ�ͽ���

net = newgrnn(P_train',T_train'); % ���GRNN����
GRNN_Pred=sim(net,P_test') % ���Խ��
% RMSE = sqrt(mean((T_Pred-T_test).^2));
% R2 = 1 - (sum((T_test - T_Pred).^2) / sum((T_test - mean(T_test)).^2));
n=0;
%3.ģ�ͷ���
for j=[1 4 7 10]
    n=n+1
    for ilon=1:397
        for ilat=1:229
            sal=SS(ilon,ilat,n);
            chl=CC(ilon,ilat,n);
            T=TT(ilon,ilat,n);
            input = [ilon,ilat,sal,T,chl];
            GRNNoutput(ilon,ilat,n)=sim(net,input');
        end
    end
end