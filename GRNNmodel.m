% GRNN模型
% Created by Wang Xuehua
clc;clear
%1.划分数据集
load('D:\课程\海洋数据可视化实习\中间生成的数据\dataformodel.mat');
load('D:\课程\海洋数据可视化实习\中间生成的数据\dataforpCO2inversion.mat');

%2.模型建立

net = newgrnn(P_train',T_train'); % 设计GRNN网络
GRNN_Pred=sim(net,P_test') % 测试结果
% RMSE = sqrt(mean((T_Pred-T_test).^2));
% R2 = 1 - (sum((T_test - T_Pred).^2) / sum((T_test - mean(T_test)).^2));
n=0;
%3.模型反演
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