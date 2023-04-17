% Generate some data
data = (randn(1,1000))';

% Fit the data to various distributions
pd1 = fitdist(data,'normal');
pd2 = fitdist(data,'exponential');
pd3 = fitdist(data,'lognormal');

% Compare the fit of the different distributions
[h,p,ksstat,cv] = kstest(data,'CDF',pd1);
fprintf('Normal distribution: ksstat = %f, p = %f \n', ksstat,p)

[h,p,ksstat,cv] = kstest(data,'CDF',pd2);
fprintf('Exponential distribution: ksstat = %f, p = %f \n', ksstat,p)

[h,p,ksstat,cv] = kstest(data,'CDF',pd3);
fprintf('Lognormal distribution: ksstat = %f, p = %f \n', ksstat,p)