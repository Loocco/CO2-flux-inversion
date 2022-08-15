% 多元线性回归拟合模型
% Created by Wang Xuehua
clc;clear
%1.划分数据集
load('D:\课程\海洋数据可视化实习\中间生成的数据\dataformodel.mat');
load('D:\课程\海洋数据可视化实习\中间生成的数据\dataforpCO2inversion.mat');

%2.模型建立
[b,bint,r,rint,stats]=regress([T_train],[P_train]);
%  Regress_Pred=b'*P_test';

% RMSE = sqrt(mean((T_Pred-T_test).^2));
% R2 = 1 - (sum((T_Pred - T_test).^2) / sum((T_test - mean(T_test)).^2));

% %3. 反演模型
%4.模型反演
% n=0;
% for j=[1 4 7 10]
%     n=n+1
%     for ilon=1:397
%         for ilat=1:229
%             sal=SS(ilon,ilat,n);
%             chl=CC(ilon,ilat,n);
%             T=TT(ilon,ilat,n);
%             input = [ilon,ilat,sal,T,chl];
%             Regressoutput(ilon,ilat,n)=b'*input';
%         end
%     end
% end
% % P = [lon1,lat1,SSS1,SST1,CHL1];
% % pCO21=b'*P;
% 
