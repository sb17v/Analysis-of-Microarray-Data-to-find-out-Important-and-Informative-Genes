clear;
a=xlsread('nprostate.xlsx');
data=dis5(a);
knumber=2;
[row col]=size(data);
data1=data(:,1:25);
data2=data(:,26:34);
for i=1:row
    sum=0;
    num0=0;
    num1=0;
    numm1=0;
    d1c0=histc(data1(i,:),0);
    d1c1=histc(data1(i,:),1);
    d1cm1=histc(data1(i,:),-1);
    d2c0=histc(data2(i,:),0);
    d2c1=histc(data2(i,:),1);
    d2cm1=histc(data2(i,:),-1);
    if(d1c0~=0 && d2c0~=0)
        num0=2;
    elseif(d1c0~=0 || d2c0~=0)
        num0=1;
    else
        num0=0;
    end
    if(d1c1~=0 && d2c1~=0)
        num1=2;
    elseif(d1c1~=0 || d2c1~=0)
        num1=1;
    else
        num1=0;
    end
    if(d1cm1~=0 && d2cm1~=0)
        numm1=2;
    elseif(d1cm1~=0 || d2cm1~=0)
        numm1=1;
    else
        numm1=0;
    end
    score(i)=((d1c0+d2c0)*(num0/knumber))+((d1c1+d2c1)*(num1/knumber))+((d1cm1+d2cm1)*(numm1/knumber));
end
    xlswrite('nprostate_score.xlsx',transpose(score));