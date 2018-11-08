% g1---> no of genes-1
function [arrout]=mutation(arrin)
g1=3;
pos=randi(g1);
if (arrin(pos)==1)
    arrin(pos)=0;
else
    arrin(pos)=1;
end
arrout=arrin;
