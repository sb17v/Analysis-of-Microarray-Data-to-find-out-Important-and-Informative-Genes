clc;
clear;
main_data=xlsread('nor_prostate_test.xls');
pro_data=xlsread('nprostate.xlsx_result.xlsx');
ind=[22    76    97   143];
final_ind=[];
[row col]=size(main_data);
ext_data=pro_data(ind,:);
j=1;
for i=1:row
    for j=1:4
        if(main_data(i,:)==ext_data(j,:))
            final_ind(j)=i;
            disp(j)
        end
    end
end
disp(final_ind);
