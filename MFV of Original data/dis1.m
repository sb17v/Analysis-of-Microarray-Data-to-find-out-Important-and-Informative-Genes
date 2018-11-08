function [ disc_micro ] = dis1( x )
%DIS1 Summary of this function goes here
%   Detailed explanation goes here
%x=xlsread('sample_data.xls');
%m=15;
%f=8;
[m,f]=size(x);
% NEXT BLOCK DISCRETIZE THE MICROARRAY DATA
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

for i=1:m    %create discrete label related array i.e disc_micro
    for j=1:f
        if(disc_factor(i,j)<-1)
            disc_micro(i,j)=-1;
        elseif((disc_factor(i,j)>=-1)&&(disc_factor(i,j)<=1))
            disc_micro(i,j)=0;
        else
            disc_micro(i,j)=1;
        end
    end
end

end

