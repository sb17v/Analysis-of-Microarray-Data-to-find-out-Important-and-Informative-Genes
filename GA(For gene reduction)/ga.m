clc;
clear;
for count=1:5
    clear;
    genepool=[];
    initset=[];
    sinitind=[];
    sinitacc=[];
    ind1=[];
    ind2=[];
    tempind=[];
    tempdata=[];
    globalacc=0;
    localacc=0;
    disp('Run');
    data=xlsread('nprostate.xlsx_result.xlsx');        %data input
    tempset=[1 0 0 0];                              %classifiers
    for i=1:96
        initset(i,:)=randomize();                   %Generate 96 random chromosomes(gene combo)
    end
    for i=1:96
        tempind=find(initset(i,:)==1);              %find gene no
        tempdata=data(tempind,:);                   %create temporary gene dataset
        initacc(i)=accuracy(tempset,tempdata);     %Calculate accuracy(initacc) for initial set of chromosomes
    end
    [sinitacc sinitind]=sort(initacc);                         %Sort initial accuracies
    ind1=sinitind(96);                                          %Find index of chromosome having best accuracy
    ind2=sinitind(95);                                          %Find indexes of chromosome having second best accuracy
    genepool=initset(sinitind,:);
    [genepool(97,:),genepool(98,:)]=crossover(genepool(95,:),genepool(96,:)); %Initial Crossover between the two best chromosomes
    genepool(99,:)=mutation(genepool(97,:));                                   %Mutation of first crossover chromosome
    genepool(100,:)=mutation(genepool(98,:));                                  %Mutation of second crossover chromosome
    tempind=[];
    tempdata=[];
    initacc=[];
    sinitacc=[];
    sinitind=[];
    ind1=[];
    ind2=[];
    for i=1:100
        tempind=find(genepool(i,:)==1);
        tempdata=data(tempind,:);                               %calculate accuracy of genepool
        initacc(i)=accuracy(tempset,tempdata);     
    end
    [sinitacc sinitind]=sort(initacc);                          %sort accuracy of genepool
    globalacc=sinitacc(100);                                    %Assign global accuracy
    disp(globalacc);
    %geneno=histc(genepool(sinitind(100),:),1)                   %Count no of genes in the chromosome having best accuracy
    localacc=sinitacc(100);                                     %Assign local accuracy
    for k=1:100
        tempind=[];
        tempdata=[];
        initacc=[];
        sinitacc=[];
        sinitind=[];
        ind1=[];
        ind2=[];
        for i=1:100
            tempind=find(genepool(i,:)==1);
            tempdata=data(tempind,:);
            initacc(i)=accuracy(tempset,tempdata);     
        end
        [sinitacc sinitind]=sort(initacc);
        ind1=sinitind(99);
        ind2=sinitind(100);
        lacc=initacc(1);
        [co1 co2]=crossover(genepool(ind1,:),genepool(ind2,:));
        mu1=mutation(co1);
        mu2=mutation(co2);
        co1ind=find(co1==1);
        co1data=data(co1ind,:);
        co1acc=accuracy(tempset,co1data);
        if(co1acc>lacc)
            genepool(1,:)=co1;
            for i=1:100
                tempind=find(genepool(i,:)==1);
                tempdata=data(tempind,:);
                initacc(i)=accuracy(tempset,tempdata);   
            end
            [sinitacc sinitind]=sort(initacc);
            tempgenepool=genepool;
            genepool=[];
            genepool=tempgenepool(sinitind,:);
            lacc=initacc(1);
        end
        co2ind=find(co2==1);
        co2data=data(co2ind,:);
        co2acc=accuracy(tempset,co2data);
        if(co2acc>lacc)
            genepool(1,:)=co2;
            for i=1:100
                tempind=find(genepool(i,:)==1);
                tempdata=data(tempind,:);
                initacc(i)=accuracy(tempset,tempdata);   
            end
            [sinitacc sinitind]=sort(initacc);
            tempgenepool=genepool;
            genepool=[];
            genepool=tempgenepool(sinitind,:);
            lacc=initacc(1);
        end
        mu1ind=find(mu1==1);
        mu1data=data(mu1ind,:);
        mu1acc=accuracy(tempset,mu1data);
        if(mu1acc>lacc)
            genepool(1,:)=mu1;
            for i=1:100
                tempind=find(genepool(i,:)==1);
                tempdata=data(tempind,:);
                initacc(i)=accuracy(tempset,tempdata);   
            end
            [sinitacc sinitind]=sort(initacc);
            tempgenepool=genepool;
            genepool=[];
            genepool=tempgenepool(sinitind,:);
            lacc=initacc(1);
        end
        mu2ind=find(mu2==1);
        mu2data=data(mu2ind,:);
        mu2acc=accuracy(tempset,mu2data);
        if(mu2acc>lacc)
            genepool(1,:)=mu2;
            for i=1:100
                tempind=find(genepool(i,:)==1);
                tempdata=data(tempind,:);
                initacc(i)=accuracy(tempset,tempdata);   
            end
            [sinitacc sinitind]=sort(initacc);
            tempgenepool=genepool;
            genepool=[];
            genepool=tempgenepool(sinitind,:);
            lacc=initacc(1);
        end
        %[sinitacc sinitind]=sort(initacc);
        localacc=sinitacc(100);
        if (localacc>=globalacc)
            disp(k);
            globalacc=localacc;
        end 
    end
    [x index]=find(initacc==globalacc);
    gc=histc(genepool(index,:),1);
    [mingc minind]=min(gc);
    disp('---------------------------------Result----------------------------------');
    disp(find(genepool(minind,:)==1));
    disp('---------Accuracy--------');
    disp(globalacc);
    %disp('---------Gene no-------');
    %disp(histc(genepool(sinitind(ind1),:),1));
end




    