function center = initialization(data,k) %k clusters
    [M1,N1] = size(data);
    first=randi(M1 + 1);
    center=data(first,:);
    for i = 2 : k
    [row,~]=size(center);
    dist=[];
    for j = 1 : M1
    min = 100000000;
    for k = 1 : row
    distance = (data(j,:) - center(k,:)).*(data(j,:) - center(k,:));
    distance = sum(distance);
    if distance < min
    min = distance;
    end
    end
    dist=[dist;min];
    end
    next=1;
    max = dist(1,:);
    for i = 2 : M1
    if dist(i,:) > max
    next=i;
    max=dist(i,:);
    end
    end
    center=[center;data(next,:)];
    end
end