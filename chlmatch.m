% ƥ��ң��Ҷ����������ʵ���ߺ�����
% Created by WangXuehua
load D:\�γ�\�������ݿ��ӻ�ʵϰ\�м����ɵ�����\trajdata.mat %lon lat����
path_chl='D:\������ԭʼ����\Ҷ����������\'
dir_output=dir(fullfile(path_chl,'*.nc'));
filenames = {dir_output.name}';

% %��ȡҶ�������ݵ�����
% path_chl='D:\������ԭʼ����\Ҷ����������\' 
% dir_output=dir(fullfile(path_chl,'*.nc'));
% filenames = {dir_output.name}';
% for i =1:length(filenames)
%     year=str2num(filenames{i}(2:5));
%     t0=datetime(year,1,1);
%     DateNumber0 = datenum(t0);
%     day=str2num(filenames{i}(6:8))-1;
%     datenumber2(i)=DateNumber0+day;
% end
% %��ȡpCO2��������
% load D:\�������м����ɵ�����\trajdata.mat
% for j=1:length(year)
%     t2=datetime(year(j),month(j),day(j));
%     DateNumber1 = datenum(t2);
%     datenumber1(j)= DateNumber1;      %����������Ϣ
% end
% % ƥ����ͬʱ�� ����Ϊһ��
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
    ilon=min(find((abs(lon1-lon(i))<0.5)|(abs(lon1-lon(i))>359.5)));%��γ�Ⱦ���Ϊ0.5��
    ilat=min(find(abs(lat1-lat(i)<0.5)));
    if isempty(ilon) 
        ilon=80;
    elseif isempty(ilat) 
        ilat=0;
    end
    chl(i)=min(chlinday(ilon,ilat));%�洢ƥ���Ҷ����Ũ��
         
end
save('D:\chltotraj.mat','chl','lon','lat');%��������