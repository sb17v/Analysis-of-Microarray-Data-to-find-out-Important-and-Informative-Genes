clc;
clear;
main_data=xlsread('lungcancer_train.xls');
pro_data=xlsread('lung.xlsx_result.xlsx');
ind=[2 22];
final_ind=[];
[row col]=size(main_data);
ext_data=pro_data(ind,:);
j=1;
for i=1:row
    for j=1:2
        if(main_data(i,:)==ext_data(j,:))
            final_ind(j)=i;
            disp(j)
        end
    end
end
disp(final_ind);
