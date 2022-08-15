%���ɭ��RFREģ��
% Created by Wang Xuehua
clc;clear
%1.�������ݼ�
load('D:\�γ�\�������ݿ��ӻ�ʵϰ\�м����ɵ�����\dataformodel.mat');
load('D:\�γ�\�������ݿ��ӻ�ʵϰ\�м����ɵ�����\dataforpCO2inversion.mat');

%2.��RF��Ӧ��Ҷ�ӽڵ���������������������ѡȡ��
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
% %���ȣ����ǿ���MSE��͵����Ǻ�ɫ�ģ�Ҳ����5���ҵ�Ҷ�ӽڵ����ȽϺ��ʣ�
% %�ٿ������߶δ�ŵ�10���ҾͲ����½�����ô���ĸ�������10�ȽϺ��ʡ�

% %3.���ɭ��ʵ��
% nTree=10;
% nLeaf=5;
% RFModel=TreeBagger(nTree,P_train,T_train,...
%     'Method','regression','OOBPredictorImportance','on', 'MinLeafSize',nLeaf);
% % [pCO2RF,RFPredictConfidenceInterval]=predict(RFModel,[lon(1:10:end,1),lat(1:10:end,1),sal(1:10:end,1),T(1:10:end,1),chl(1:10:end,1)]);
% % [RFRE_Pred,RFPredictConfidenceInterval]=predict(RFModel,P_test);
% % RFRE_Pred=RFRE_Pred';
% 
% n=0;
% %4.ģ�ͷ���
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