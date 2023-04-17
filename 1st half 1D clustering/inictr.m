function [c1new,c2new]=inictr(dataset)
    [x,y]=size(dataset);
    m1=round(rand(x,1));
    m2=1-m1;
    
    result1=0;
    result2=0;
    for i=1:x
        result1=result1+m1(i)*dataset(i);
        result2=result2+m1(i)*dataset(i);
    end
    
    c1new=result1/sum(m1);
    c2new=result2/sum(m2);
    


end
    