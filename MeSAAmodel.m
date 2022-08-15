% MeSAA模型
% Created by Wang Xuehua
clc;clear
%1.划分数据集
load('D:\课程\海洋数据可视化实习\中间生成的数据\dataformodel.mat');
load('D:\课程\海洋数据可视化实习\中间生成的数据\dataforpCO2inversion.mat');
%2.建造模型
% nn=0
% for i=1:1:numtrain
%     nn=nn+1;
%         ssal=sal(i,1);
%         cchl=chl(i,1);
%         TT=T(i,1);
%         Ta=1400+(2340-1400)./35.*ssal;%端元值
%         Dic=1600+(2100-1600)./35.*ssal;
%         par1type =    1; par1     = Ta;  par2type =    2; par2     = Dic;k1k2c    =    4; kso4c    =    1;
%         presin   =    0;tempout  =    0;  presout  =    0; sil      =   50;  po4      =    2; pHscale  =    1;
%         isal      =   ssal;
%         tempin   =   TT;
%         A=CO2SYS(par1,par2,par1type,par2type,isal,tempin,tempout,presin,presout,sil,po4,pHscale,k1k2c,kso4c);
%         %modeledpCO2=A(:,4);%不考虑生物作用量化
%         a=A(:,4);
%         b=cchl;
%         a1=a(1:length(b))';
%         MeSAA_Pred(nn)=a1-80.66*(b-log10(0.03));
% 
%     end
% RMSE = sqrt(mean((T_Pred-T_test).^2));
% R2 = 1 - (sum((T_Pred - T_test).^2) / sum((T_test - mean(T_test)).^2));

%反演模型
n=0
for j=[1 4 7 10]
       n=n+1;
       for ilon=1:397
            ilon;
            for ilat=1:229
                sal=SS(ilon,ilat,n);
                chl=CC(ilon,ilat,n);
                T=TT(ilon,ilat,n);
                Ta=1400+(2340-1400)./35.*sal;%端元值
                Dic=1600+(2100-1600)./35.*sal;
                par1type =    1; par1     = Ta;  par2type =    2; par2     = Dic;k1k2c    =    4; kso4c    =    1;
                presin   =    0;tempout  =    0;  presout  =    0; sil      =   50;  po4      =    2; pHscale  =    1;
                isal      =   sal;
                tempin   =   T;
                A=CO2SYS(par1,par2,par1type,par2type,isal,tempin,tempout,presin,presout,sil,po4,pHscale,k1k2c,kso4c);
                %modeledpCO2=A(:,4);%不考虑生物作用量化
                a=A(:,4);
                b=chl;
                a1=a(1:length(b))';
                MeSAAoutput(ilon,ilat,n)=a1-80.66*(b-log10(0.03));
            end
       end

    end
