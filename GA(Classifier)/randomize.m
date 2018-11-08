function [rarr]=randomize()
clear;
arr=randi(2,1,4);
for i=1:4
    if(arr(i)==2)
        arr(i)=0;
    end
end
rarr=arr;