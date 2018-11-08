clear;
clc;
file=input('Enter the file name: ');
data=xlsread(file);
[row col]=size(data);
for i=1:row
    %meanrow(i)=mean(data(i,:));
    sdrow(i)=std(data(i,:));
end
%meanf=transpose(meanrow);
sdf=transpose(sdrow);
%meanname=strcat(file,'_mean.xls');
sdname=strcat(file,'_sd.xls');
%xlswrite(meanname,meanf);
xlswrite(sdname,sdf);
