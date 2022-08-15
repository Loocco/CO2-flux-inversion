% 产生数据、数据划分
% Created by WANG Xuehua
%1.产生数据
clc;clear
load('D:\第五组可视化设计\中间生成的数据\SOCATv2021.mat');
load('D:\课程\海洋数据可视化实习\中间生成的数据\trajdata.mat');
load('D:\课程\海洋数据可视化实习\中间生成的数据\chltotraj.mat');
chl=chl';
sal(isnan(chl)|chl==0)=[];
T(isnan(chl)|chl==0)=[];
pCO2(isnan(chl)|chl==0)=[];
dtl(isnan(chl)|chl==0)=[];
year(isnan(chl)|chl==0)=[];
month(isnan(chl)|chl==0)=[];
day(isnan(chl)|chl==0)=[];
lon(isnan(chl)|chl==0)=[];
lat(isnan(chl)|chl==0)=[];
chl(isnan(chl)|chl==0)=[];
% RandomNumber=(randperm(length(pCO2),floor(length(pCO2)*0.2)))';
for i=1:length(RandomNumber)
    m=RandomNumber(i,1);
    sal(i,1)=sal(m,1);
    T(i,1)=T(m,1);
    pCO2(i,1)= pCO2(m,1);
    dtl(i,1)=dtl(m,1);
    year(i,1)=year(m,1);
    month(i,1)=month(m,1);
    day(i,1)=day(m,1);
    lon(i,1)=lon(m,1);
    lat(i,1)=lat(m,1);
    chl(i,1)=chl(m,1);
end
% 划分数据
numtrain=ceil(4/5*length(chl));% 训练集――4/5个样本
P_train = [lon(1:1:numtrain,1),lat(1:1:numtrain,1),sal(1:1:numtrain,1),T(1:1:numtrain,1),chl(1:1:numtrain,1)];
T_train = [pCO2(1:1:numtrain,1)];
lon_train = [lon(1:1:numtrain,1)];
lat_train = [lat(1:1:numtrain,1)];
year_train = [year(1:1:numtrain,1)];
numtrain=ceil(4/5*length(chl));
numtest=1/5*length(chl);% 测试集――1/5个样本
P_test = [lon(numtrain+1:1:length(chl),1),lat(numtrain+1:1:length(chl),1),sal(numtrain+1:1:length(chl),1),...
    T(numtrain+1:1:length(chl),1),chl(numtrain+1:1:length(chl),1)];% 测试集――1/5个样本
T_test = [pCO2(numtrain+1:1:length(chl),1)]';
lon_test = [lon(numtrain+1:1:length(chl),1)]';
lat_test = [lat(numtrain+1:1:length(chl),1)]';
year_test = [year(numtrain+1:1:length(chl),1)]';
month_test = [dtl(numtrain+1:1:length(chl),1)]';
day_test = [dtl(numtrain+1:1:length(chl),1)]';



