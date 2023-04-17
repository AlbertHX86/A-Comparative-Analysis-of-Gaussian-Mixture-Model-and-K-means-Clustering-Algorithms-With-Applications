y = chi2rnd(5,1500,1);                  %自由度5的卡方分布1500个数
histogram(y,50);

maxp = -1;
re_y=[];
re_lambda=0;
for lambda=-3:0.01:3
    if lambda==0                        %box-cox变换
        newy = log(y);
    else
        newy = (y.^lambda-1)./lambda;
    end
    [~,p,~] = swtest(newy);             %Shapiro-Wilk正态分布检验
    
    if p > maxp
        maxp = p;
        re_y = newy;
        re_lambda = lambda;
    end
end

figure;
histogram(re_y,100);