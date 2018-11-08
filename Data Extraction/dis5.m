function [ disc_micro ] = dis5( x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[m,f]=size(x);
for i=1:m
    total_row(i)=0;
end
for i=1:m    % calculate mean of all genes
    for j=1:f
        total_row(i)=total_row(i)+x(i,j);
    end
    mean_row(i)=total_row(i)/f;
end
for i=1:m        % calculate standard deviation of all genes
    dist=0;
    for j=1:f
        dist=dist+((mean_row(i)-x(i,j))*(mean_row(i)-x(i,j)));
    end
    dist=sqrt(dist);
    standev_row(i)=sqrt(dist);
end
for i=1:m         % discretize all elements of x to disc_micro(i,j) as -2,-1,0,1 and 2
    for j=1:f
        disc_factor(i,j)=round((mean_row(i)-x(i,j))/standev_row(i));
    end
end
 
negcount=0;
negsum=0;
poscount=0;
possum=0;
for i=1:m
    for j=1:f
        if (disc_factor(i,j)<-1)
            negsum=negsum+disc_factor(i,j);
            negcount=negcount+1;
        end
        if (disc_factor(i,j)>1)
            possum=possum+disc_factor(i,j);
            poscount=poscount+1;
        end
    end
end
negavg=negsum/negcount;
posavg=possum/poscount;


for i=1:m    %defined discrete label
    for j=1:f
        if(disc_factor(i,j)<negavg)
            disc_micro(i,j)=1;
        elseif((disc_factor(i,j)>=negavg)&&(disc_factor(i,j)<-1))
            disc_micro(i,j)=2;
        elseif((disc_factor(i,j)>=-1)&&(disc_factor(i,j)<=1))
            disc_micro(i,j)=3;
        elseif((disc_factor(i,j)>1)&&(disc_factor(i,j)<=posavg))
            disc_micro(i,j)=4;
        else
            disc_micro(i,j)=5;
        end
    end
end

end

