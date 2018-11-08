clear
sum=0;
s=input('enter the file name');
pa=xlsread(s);
[row col]=size(pa);
for i=1:row
    xbar=mean(pa(i,:));
    for k=1:row
        a(1,:)=(pa(i,:)-xbar);
        b(:,1)=(pa(k,:)-mean(pa(k,:)));
        val1=(a*b);
        c=sqrt(a*transpose(a));
        d=sqrt(transpose(b)*b);
        val2=c*d;
        result(i,k)=val1/val2;
        %sum(val);
    end
end
for i=1:row
    for j=1:row
        if(i==j)
            result(i,j)=0;
        end
    end
end

for i=1:row
    pc(i)=mean(result(i,:));
end
xlswrite('nprostate_pearson_correlation.xlsx',transpose(pc));
        
        
        
        
        
        
    