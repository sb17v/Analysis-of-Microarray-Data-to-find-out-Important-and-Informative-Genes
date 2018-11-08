% g2--->no of genes
function [arr3,arr4]=crossover(arr1,arr2)
g2=146;
pos=randi((g2-1));
arr3(1:pos)=arr2(1:pos);
arr3(pos+1:g2)=arr1(pos+1:g2);
arr4(1:pos)=arr1(1:pos);
arr4(pos+1:g2)=arr2(pos+1:g2);
