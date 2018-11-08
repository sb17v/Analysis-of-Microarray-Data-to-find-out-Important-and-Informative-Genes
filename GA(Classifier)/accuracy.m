%a1,a2 ---> index of strating and ending point of middle group
%a3,a4 ---> index of starting and ending point of left hand sided part of
%           second group
%a5,a6 ---> index of starting and ending point of right hand sided part of
%           second group
%b1 ---> no of elements in first group
%b2 ---> no of elements in second group
%c1 ---> no of elements in left hand sided part of
%        second group
%d1 ---> Total no of samples
% For Lung
%a1=9;
% a2=24;
% a3=1;
% a4=8;
% a5=25;
% a6=32;
% b1=16;
% b2=16;
% c1=8;
% d1=32;
% For Prostrate
% a1=27;
% a2=77;
% a3=1;
% a4=26;
% a5=78;
% a6=102;
% b1=51;
% b2=51;
% c1=26;
% d1=102;
% For All
% a1=14;
% a2=32;
% a3=1;
% a4=13;
% a5=33;
% a6=38;
% b1=19;
% b2=19;
% c1=13;
% d1=38;
% For DLBCL
% a1=30;
% a2=67;
% a3=1;
% a4=29;
% a5=68;
% a6=77;
% b1=39;
% b2=38;
% c1=29;
% d1=77;
% Breast
% a1=18;
% a2=56;
% a3=1;
% a4=17;
% a5=57;
% a6=78;
% b1=39;
% b2=39;
% c1=17;
% d1=78;
function[acc]= accuracy(tempset,data)
a1=13;
a2=29;
a3=1;
a4=12;
a5=30;
a6=34;
b1=17;
b2=17;
c1=12;
d1=34;
[r c]=size(tempset);
class=[ones(1,25) zeros(1,9)];        %main class level
%class=xlsread('class.xlsx');
trandata=transpose(data);             %tanspose data where samles are in rows and genes are in columns
tranclass=transpose(class);             %transpose class
group1=trandata(a1:a2,:);                
group2=vertcat(trandata(a3:a4,:),trandata(a5:a6,:));          %divide data into 2 group
train1=group1;  %Training data of 1st group
data1=group2;   %Test data of 2nd group
train2=group2;
data2=group1;
class1=tranclass(a1:a2,:);
class2=vertcat(tranclass(a3:a4,:),tranclass(a5:a6,:));        %divide main class into 2 sub class
%disp(class1);
if(tempset(1,1)==1)
    structsv1=svmtrain(train1,class1);              %Run SVM
    result1(:,1)=svmclassify(structsv1,data1);
    structsv2=svmtrain(train2,class2);              
    result2(:,1)=svmclassify(structsv2,data2);
else
    result1(1:b1,1)=2;
    result2(1:b2,1)=2;
end
if(tempset(1,2)==1)
    result1(:,2)=knnclassify(data1,train1,class1); 
    result2(:,2)=knnclassify(data2,train2,class2);%Run KNN
else
    result1(1:b1,2)=2;
    result2(1:b2,2)=2;
end
if(tempset(1,3)==1)
    structnb=NaiveBayes.fit(train1,class1);
    result1(:,3)=structnb.predict(data1);  
    structnb=NaiveBayes.fit(train2,class2);
    result2(:,3)=structnb.predict(data2); %Run NaiveBayes
else
    result1(1:b1,3)=2;
    result2(1:b2,3)=2;
end
if(tempset(1,4)==1)
    structregtree=classregtree(train1,class1);
    result1(:,4)=eval(structregtree,data1);
    structregtree=classregtree(train2,class2);
    result2(:,4)=eval(structregtree,data2);     %Run TreeReg
else
    result1(1:b1,4)=2;
    result2(1:b2,4)=2;
end
result=vertcat(result1(1:c1,:),result2(1:b2,:),result1(c1+1:b1,:));     % Merging the result. Now check tranclass and result
acc=0;
for i=1:d1
    if(tranclass(i,1)==1)
        %isempty(find(result(i,:)==1))
        if(isempty(find(result(i,:)==1))==0)
            acc=acc+1;                                              %Accuracy Calculation 
        end
    end
    if(tranclass(i,1)==0)
        %isempty(find(result(i,:)==0))
        if(isempty(find(result(i,:)==0))==0)
            acc=acc+1;
        end
    end
end
%disp(result);
%disp(acc);

    