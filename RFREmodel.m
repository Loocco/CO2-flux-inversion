%随机森林RFRE模型
% Created by Wang Xuehua
clc;clear
%1.划分数据集
load('D:\课程\海洋数据可视化实习\中间生成的数据\dataformodel.mat');
load('D:\课程\海洋数据可视化实习\中间生成的数据\dataforpCO2inversion.mat');

%2.对RF对应的叶子节点数与树的数量加以择优选取。
set(gcf,'color','white');
set(gcf,'unit','normalized','position',[0.02,0.02,0.62,0.50]);
set(gca,'fontsize',10,'linewidth',2);
box on
leaf=[2 5 10 20 50];
col='rbcmy';
for i=1:length(leaf)
    b = TreeBagger(200,P_train,T_train,'Method','regression','OOBPrediction','on',...
			'MinLeafSize',leaf(i));
    plot(oobError(b),col(i),'linewidth',2)
    hold on
end
xlabel('Number of Grown Trees')
ylabel('Mean Squared Error') 
legend({'2' '5' '10' '20' '50'},'Location','NorthEast')
hold off
% %首先，我们看到MSE最低的线是红色的，也就是5左右的叶子节点数比较合适；
% %再看各个线段大概到10左右就不再下降，那么树的个数就是10比较合适。

% %3.随机森林实现
% nTree=10;
% nLeaf=5;
% RFModel=TreeBagger(nTree,P_train,T_train,...
%     'Method','regression','OOBPredictorImportance','on', 'MinLeafSize',nLeaf);
% % [pCO2RF,RFPredictConfidenceInterval]=predict(RFModel,[lon(1:10:end,1),lat(1:10:end,1),sal(1:10:end,1),T(1:10:end,1),chl(1:10:end,1)]);
% % [RFRE_Pred,RFPredictConfidenceInterval]=predict(RFModel,P_test);
% % RFRE_Pred=RFRE_Pred';
% 
% n=0;
% %4.模型反演
% for j=[1 4 7 10]
%     n=n+1
%     for ilon=1:397
%         for ilat=1:229
%             sal=SS(ilon,ilat,n);
%             chl=CC(ilon,ilat,n);
%             T=TT(ilon,ilat,n);
% %             input = [ilon,ilat,sal,T,chl];
%             input = [ilon,ilat,sal,T,chl];
%             [RFRE_Pred,RFPredictConfidenceInterval]=predict(RFModel,input);
%             RFREoutput(ilon,ilat,n)=RFRE_Pred;
%         end
%     end
% end