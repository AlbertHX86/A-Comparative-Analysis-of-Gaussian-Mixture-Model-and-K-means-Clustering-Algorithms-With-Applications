function re_y=normal_transform(y)
    maxp = -1;
    re_y=[];
    re_lambda=0;
    for lambda=-3:0.01:3
        if lambda==0                        %box-cox
            newy = log(y);
        else
            newy = (y.^lambda-1)./lambda;
        end
        [~,p,~] = swtest(newy);             %Shapiro-Wilk
        
        if p > maxp
            maxp = p;
            re_y = newy;
            re_lambda = lambda;
        end
    end
    
    figure;
    histogram(re_y,100);
    [mu,sigma]=normfit(re_y);
    mu
    sigma
    
end