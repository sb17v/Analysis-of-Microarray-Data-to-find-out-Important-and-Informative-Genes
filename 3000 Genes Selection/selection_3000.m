clc;
clear;
data=xlsread('nprostate_mfv_total.xlsx');
[row col]=size(data);
[sort_data ind]=sort(data(:,1),'descend');
final_data(:,1)=sort_data;
final_data(:,2)=data(ind,2);
if row>3000
    xlswrite('nprostate_3000.xlsx',final_data(1:3000,:));
else
    xlswrite('nprostate_3000.xlsx',final_data(1:row,:));
end
