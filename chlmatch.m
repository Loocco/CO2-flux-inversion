% 匹配遥感叶绿素数据至实测走航数据
% Created by WangXuehua
load D:\课程\海洋数据可视化实习\中间生成的数据\trajdata.mat %lon lat数据
path_chl='D:\第五组原始数据\叶绿素天数据\'
dir_output=dir(fullfile(path_chl,'*.nc'));
filenames = {dir_output.name}';

% %提取叶绿素数据的日期
% path_chl='D:\第五组原始数据\叶绿素天数据\' 
% dir_output=dir(fullfile(path_chl,'*.nc'));
% filenames = {dir_output.name}';
% for i =1:length(filenames)
%     year=str2num(filenames{i}(2:5));
%     t0=datetime(year,1,1);
%     DateNumber0 = datenum(t0);
%     day=str2num(filenames{i}(6:8))-1;
%     datenumber2(i)=DateNumber0+day;
% end
% %提取pCO2日期数据
% load D:\第五组中间生成得数据\trajdata.mat
% for j=1:length(year)
%     t2=datetime(year(j),month(j),day(j));
%     DateNumber1 = datenum(t2);
%     datenumber1(j)= DateNumber1;      %查阅日期信息
% end
% % 匹配相同时间 精度为一天
% chlxuhao=zeros(1,length(datenumber1));
% for j=1:length(datenumber1)
%         if isempty( find(datenumber2==datenumber1(j)) )==1
%             continue
%         end
%          chlxuhao(j)=find(datenumber2==datenumber1(j));         
% end


for i=1:length(lon)
    i;
    if chlxuhao(i)==0
        continue
    end
    filename=filenames{chlxuhao(i)};
    filepath=strcat(path_chl, '\',filename);
    chlinday=ncread(filepath,'chlor_a');
    lon1=ncread(filepath,'lon');
    lat1=ncread(filepath,'lat');
    ilon=min(find((abs(lon1-lon(i))<0.5)|(abs(lon1-lon(i))>359.5)));%经纬度精度为0.5°
    ilat=min(find(abs(lat1-lat(i)<0.5)));
    if isempty(ilon) 
        ilon=80;
    elseif isempty(ilat) 
        ilat=0;
    end
    chl(i)=min(chlinday(ilon,ilat));%存储匹配的叶绿素浓度
         
end
save('D:\chltotraj.mat','chl','lon','lat');%保存数据