%g-->no of generation(100)
%p-->no of chromosome in genepool
clc;
clear;
a=[];
g=100;
p=10;
for i=1:10
    data=xlsread('nprostate.xlsx_result.xlsx');       %Read Data
    arr1=randomize();       
    arr2=randomize();
    arr3=randomize();               %Generate 6 random chromosomes 
    arr4=randomize();
    arr5=randomize();
    arr6=randomize();
    initset=vertcat(arr1,arr2,arr3,arr4,arr5,arr6);      %Initial set of 6 random chromosomes
    for i=1:6
        initacc(i)=accuracy(initset(i,:),data);     %Calculate accuracy(initacc) for initial set of chromosomes
    end
    sinitacc=sort(initacc);                         %Sort initial accuracies
    ind1=find(initacc==sinitacc(6));                %Find index of chromosome having best accuracy
    ind2=find(initacc==sinitacc(5));                %Find indexes of chromosome having second best accuracy
    genepool=initset;                               %Insert initial chromosomes into genepool
    [arr7,arr8]=crossover(initset(ind1,:),initset(ind2,:)); %Initial Crossover between the two best chromosomes
     arr9=mutation(arr7);                                   %Mutation of first crossover chromosome
     arr10=mutation(arr8);                                  %Mutation of second crossover chromosome
     genepool(7,:)=arr7;
     genepool(8,:)=arr8;
     genepool(9,:)=arr9;                                    %Insert the chromosomeswhich are created from crossover and mutation into genpool. Now it have 10 chromosomes. We assumed that the population of genepool=10 
     genepool(10,:)=arr10;
     for i=1:p
         acc(i)=accuracy(genepool(i,:),data);                  %Calculate the accuracy of chromosomes resides within genepool
     end
     sacc=sort(acc);                                            %Sort the genepool accuracies
     globalaccuracy=sacc(10);                                   %Set Global accuracy for initial iteration. For 1st iteration gloabl accuracy=local accuracy
     for i=1:g                                                %No of iteration for GA
         for i=1:p
             tempacc(i)=accuracy(genepool(i,:),data);           %Calculate temporary accuracy of genepool
         end
         stempacc=sort(tempacc);                                %Sort temporary accuracies
         tempind1=find(tempacc==stempacc(10));              
         tempind2=find(tempacc==stempacc(9));                   %Find index of best(having best accuracy) 2 chromosomes inside genepool
         [temparr1,temparr2]=crossover(genepool(tempind1,:),genepool(tempind2,:));      %Crossover between best two chromosomes
         localaccuracy=accuracy(temparr1,data);                                         %calculate local accuracy for 1st crossover
         if(localaccuracy>globalaccuracy)
             globalaccuracy=localaccuracy;                                              %Assigning of global accuracy, finding chromosomes with minimum accuracy and modification of genepool
             minacc=min(tempacc);
             minind=find(tempacc==minacc);
             tempacc(minind)=globalaccuracy;
             genepool(minind,:)=temparr1;
         end
         localaccuracy=accuracy(temparr2,data);                                         %calculate local accuracy for 2nd crossover
         if(localaccuracy>globalaccuracy)
             globalaccuracy=localaccuracy;                                              %Assigning of global accuracy, finding chromosomes with minimum accuracy and modification of genepool
             minacc=min(tempacc);
             minind=find(tempacc==minacc);
             tempacc(minind)=globalaccuracy;
             genepool(minind,:)=temparr2;
         end
         temparr3=mutation(temparr1);                                                   
         localaccuracy=accuracy(temparr3,data);                                         %calculate local accuracy for 2nd crossover
         if(localaccuracy>globalaccuracy)
             globalaccuracy=localaccuracy;                                              %Assigning of global accuracy, finding chromosomes with minimum accuracy and modification of genepool
             minacc=min(tempacc);
             minind=find(tempacc==minacc);
             tempacc(minind)=globalaccuracy;
             genepool(minind,:)=temparr3;
         end
         temparr4=mutation(temparr2);             
         localaccuracy=accuracy(temparr4,data);                                        %calculate local accuracy for 2nd crossover
         if(localaccuracy>globalaccuracy)
             globalaccuracy=localaccuracy;                                             %Assigning of global accuracy, finding chromosomes with minimum accuracy and modification of genepool
             minacc=min(tempacc);
             minind=find(tempacc==minacc);
             tempacc(minind)=globalaccuracy;
             genepool(minind,:)=temparr4;
         end
     end
     for i=1:10
             finalacc(i)=accuracy(genepool(i,:),data);                                  %Determine final genepool
     end
     finalindex=find(finalacc==globalaccuracy);
     finalset=unique(genepool(finalindex,:),'rows');                                    %Determine unique set of chromosomes having best accuracy
     disp('Global Accuracy: ');
     disp(globalaccuracy);
     disp('Local Accuracy: ');
     disp(localaccuracy);
     disp('Genepool: ');
     disp(genepool);
     disp('Final Index: ');
     disp(finalindex);
     disp('Final Result: ');
     disp(finalset);
     a=vertcat(a,finalset);
end     
disp('----------------------------------------Best Set:--------------------------------------- ');
disp(unique(a,'rows'));


    
        

