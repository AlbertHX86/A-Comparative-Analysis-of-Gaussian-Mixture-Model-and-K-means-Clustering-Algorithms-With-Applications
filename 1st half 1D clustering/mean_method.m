function [c1,c2]=mean_method(data)
% initialization
    [m,~]=size(data);
    m1=round(rand(m,1));
    m2=1-m1;
    
    result1=0;
    result2=0;
    for i=1:m
        result1=result1+m1(i)*data(i);
        result2=result2+m2(i)*data(i);
    end
    
    c1=result1/sum(m1);
    c2=result2/sum(m2);
    % mean method
    iter=1;
    clusterw=data;
    
    while iter<10000
    
        cluster1w=[];
        cluster2w=[];
        
        m1new=zeros(1,m);
        m2new=zeros(1,m);
    
    
        for i=1:m       
            d1=clusterw(i)-c1;
            d2=clusterw(i)-c2;
            if abs(d1)<abs(d2)
                cluster1w(end+1)=clusterw(i);
                m1new(i)=1;
                m2new(i)=0;
                
    
            else
                cluster2w(end+1)=clusterw(i);
                m2new(i)=1;
                m1new(i)=0;
            end
        end
    
    
        % to upgrade m1 and m2
        % when d1<d2, m1new append 1, else remain 0
        clusterw=[cluster1w cluster2w];
        result1=0;
        result2=0;
        for j=1:m
            result1=result1+m1new(j)*clusterw(j);
            result2=result2+m2new(j)*clusterw(j);
        end
        %get new centrers
        c1=result1/sum(m1new);
        c2=result2/sum(m2new);
        iter=iter+1;
        
    end

end