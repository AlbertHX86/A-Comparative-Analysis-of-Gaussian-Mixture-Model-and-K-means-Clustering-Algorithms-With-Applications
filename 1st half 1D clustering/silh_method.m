function x=silh_method(data)
    X=data;
    %用kmeans算法确定最佳聚类数目
    numc=5;
    silh_m=zeros(1,numc);
    for i=1:numc
    kidx=kmeans(X,i);
    silh=silhouette(X,kidx);%calculate silhouette score
    silh_m(i)=mean(silh);
    end
    figure;
    x=plot(1:numc,silh_m,'o-');
    xlabel('类别数');
    ylabel('平均轮廓值');
    title('不同类别对应的平均轮廓值');
end