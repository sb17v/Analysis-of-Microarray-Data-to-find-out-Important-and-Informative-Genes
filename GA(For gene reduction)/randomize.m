% g2--->no of genes
function [rarr]=randomize()
clear;
g2=146;
count=randi(5,1,1);
for i=1:count
    a(i)=randi(g2,1,1);
end
rarr=[zeros(1,g2)];
rarr(a)=1;
% arr=randi(2,1,g2);
% for i=1:g2
%     if(arr(i)==2)
%         arr(i)=0;
%     end
% end
% rarr=arr;