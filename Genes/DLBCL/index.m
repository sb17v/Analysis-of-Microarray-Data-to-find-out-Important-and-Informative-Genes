clc;
clear;
main_data=xlsread('DLBCLTumor.xls');
pro_data=xlsread('DLBCL.xlsx_result.xlsx');
ind=[6 14 7];
final_ind=[];
[row col]=size(main_data);
ext_data=pro_data(ind,:);
j=1;
for i=1:row
    for j=1:3
        if(main_data(i,:)==ext_data(j,:))
            final_ind(j)=i;
            disp(j)
        end
    end
end
disp(final_ind);
