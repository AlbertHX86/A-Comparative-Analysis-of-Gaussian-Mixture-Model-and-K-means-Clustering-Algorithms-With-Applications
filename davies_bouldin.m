function [dbi] = davies_bouldin(data, cluster_labels)
    num_clusters = length(unique(cluster_labels));
    cluster_means = zeros(num_clusters, size(data, 2));
    cluster_counts = zeros(num_clusters, 1);
    
    % Calculate cluster means
    for i = 1:num_clusters
        cluster_data = data(cluster_labels == i, :);
        cluster_means(i, :) = mean(cluster_data, 1);
        cluster_counts(i) = size(cluster_data, 1);
    end
    
    S = zeros(num_clusters, 1);
    R = zeros(num_clusters, num_clusters);
    
    % Calculate intra-cluster distance
    for i = 1:num_clusters
        cluster_data = data(cluster_labels == i, :);
        S(i) = sum(sqrt(sum(bsxfun(@minus, cluster_data, cluster_means(i, :)).^2, 2))) / cluster_counts(i);
    end
    
    % Calculate inter-cluster distance
    for i = 1:num_clusters
        for j = 1:num_clusters
            if i ~= j
                R(i, j) = (S(i) + S(j)) / sqrt(sum((cluster_means(i, :) - cluster_means(j, :)).^2));
            end
        end
    end
    
    % Calculate Davies-Bouldin index
    dbi = mean(max(R, [], 2));
end
