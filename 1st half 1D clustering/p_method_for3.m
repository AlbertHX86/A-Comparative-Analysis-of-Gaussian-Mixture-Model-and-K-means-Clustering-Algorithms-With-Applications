function [mu1,mu2,mu3]=p_method_for3(data,sigma)
%initialize use multiple labels to label
    [m,~]=size(data);

    m1=randi([0,33],100,1)/100;
    m2=randi([34,66],100,1)/100;
    m3=randi([67,100],100,1)/100;
    data100=data(1:100);
    data200=data(101:200);
    data300=data(201:300);
    
    result1=0;
    result2=0;
    result3=0;
    for i=1:100
        result1=result1+m1(i)*data100(i);
        result2=result2+m2(i)*data200(i);
        result3=result3+m3(i)*data300(i);
    end
    
    mu1=result1/sum(m1);
    mu2=result2/sum(m2);
    mu3=result3/sum(m3);
    
    iter=1;
    
    cluster=data;
    
    

    
    while iter<10
        
        PZAset=[];
        PZBset=[];
        PZCset=[];
        
    
        for i=1:m
    
            PZA=(exp(-(cluster(i)-mu1)^2/(2*sigma^2)))/((exp(-(cluster(i)-mu1)^2/(2*sigma^2)))+exp(-(cluster(i)-mu2)^2/(2*sigma^2))+exp(-(cluster(i)-mu3)^2/(2*sigma^2)));
            PZAset(end+1)=PZA;
            
            PZB=(exp(-(cluster(i)-mu2)^2/(2*sigma^2)))/((exp(-(cluster(i)-mu1)^2/(2*sigma^2)))+exp(-(cluster(i)-mu2)^2/(2*sigma^2))+exp(-(cluster(i)-mu3)^2/(2*sigma^2)));
            PZBset(end+1)=PZB;
    
            PZC=(exp(-(cluster(i)-mu3)^2/(2*sigma^2)))/((exp(-(cluster(i)-mu1)^2/(2*sigma^2)))+exp(-(cluster(i)-mu2)^2/(2*sigma^2))+exp(-(cluster(i)-mu3)^2/(2*sigma^2)));
            PZCset(end+1)=PZC;
    
    
        end      
        iter=iter+1;
        result1=0;
        result2=0;
        result3=0;
        
        for j=1:m
            result1=result1+PZAset(j)*cluster(j);
            result2=result2+PZBset(j)*cluster(j);
            result3=result3+PZCset(j)*cluster(j);
        end
        mu1=result1/sum(PZAset);
        mu2=result2/sum(PZBset);
        mu3=result3/sum(PZCset);
    
    end
    
    

end