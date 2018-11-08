clc;
clear;
main_data=xlsread('colontumor.xlsx');
pro_data=xlsread('colon.xlsx_result.xlsx');
ind=[1 7 10];
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
