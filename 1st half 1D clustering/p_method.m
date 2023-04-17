function [a,b]=p_method(data,sigma)
%initialize
    [m,~]=size(data);
    m1=round(rand(m,1));
    m2=1-m1;
    
    result1=0;
    result2=0;
    for i=1:m
        result1=result1+m1(i)*data(i);
        result2=result2+m2(i)*data(i);
    end
    
    c1new=result1/sum(m1);
    c2new=result2/sum(m2);
    while c1new==c2new
        [c1new,c2new]=inictr(data);
    end
    
%     h1(end+1)=c1new;
%     h2(end+1)=c2new;
    hc1new=c1new;
    hc2new=c2new;

    mu1=hc1new;
    mu2=hc2new;
    iter=1;
    cluster1=[];
    cluster2=[];
    cluster=data;
    
    
    while iter<1000
        p1new=zeros(1,m);
        p2new=zeros(1,m);
        PZAset=[];
        PZBset=[];
        cluster1=[];
        cluster2=[];
    
        for i=1:m
    
            PZA=(exp(-(cluster(i)-mu1)^2/(2*sigma^2)))/((exp(-(cluster(i)-mu1)^2/(2*sigma^2)))+exp(-(cluster(i)-mu2)^2/(2*sigma^2)));
            PZAset(end+1)=PZA;
            
    
            PZB=(exp(-(cluster(i)-mu2)^2/(2*sigma^2)))/((exp(-(cluster(i)-mu2)^2/(2*sigma^2)))+exp(-(cluster(i)-mu1)^2/(2*sigma^2)));
            PZBset(end+1)=PZB;
    
    
        end      
        
        
        iter=iter+1;
        result1=0;
        result2=0;
        for j=1:m
            result1=result1+PZAset(j)*cluster(j);
            result2=result2+PZBset(j)*cluster(j);
        end
        mu1=result1/sum(PZAset);
        mu2=result2/sum(PZBset);
        
        
    
    end
    
    a=mu1;
    b=mu2;

end