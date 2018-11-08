clc;
clear;
input_3000=xlsread('nprostate_3000.xlsx');
ori_data=xlsread('nor_prostate_test.xls');
out_data=ori_data(input_3000(:,2),:);
xlswrite('ncolon.xlsx',out_data);