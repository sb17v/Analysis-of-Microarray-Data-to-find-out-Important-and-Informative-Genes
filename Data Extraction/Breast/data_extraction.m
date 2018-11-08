clear;
f=input('enter the original file');
a=input('enter the score file');
b=input('enter the mfv file');
c=input('enter the pearson file');
d=input('enter the sd file');
data=xlsread(f);
data_score=xlsread(a);
data_mfv=xlsread(b);
data_pearson=xlsread(c);
data_sd=xlsread(d);
mean_score=mean(data_score);
mean_mfv=mean(data_mfv(:,1));
mean_pearson=mean(data_pearson);
mean_sd=mean(data_sd);
for i=1:length(data_score)
    if(data_score(i,:)<mean_score)
        result(i,1)=1;
    else
        result(i,1)=0;
    end
end
for i=1:length(data_mfv)
    if(data_mfv(i,1)>mean_mfv)
        result(data_mfv(i,2),2)=1;
    else
        result(data_mfv(i,2),2)=0;
    end
end
for i=1:length(data_pearson)
    if(data_pearson(i,:)<mean_pearson)
        result(i,3)=1;
    else
        result(i,3)=0;
    end
end
for i=1:length(data_sd)
    if(data_sd(i,:)>mean_sd)
        result(i,4)=1;
    else
        result(i,4)=0;
    end
end
for i=1:612             %no of genes
    if(isempty(find(result(i,2:4)==0))==1)
        result1(i,1)=1;
    end
end
count=histc(result1(:,1),1);
disp(count);
index=find(result1(:,1));
result_data=data(index,:);
name=strcat(f,'_result.xlsx');
xlswrite(name,result_data);




