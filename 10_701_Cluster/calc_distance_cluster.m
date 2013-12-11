function [ current_cluster_with_distance ] = calc_distance_cluster( current_cluster, key )
%CALC_DISTANCE_CLUSTER Summary of this function goes here
%   Detailed explanation goes here

global CLUSTER_PARAM

max_time_gap = CLUSTER_PARAM.max_time_gap;

num_cluster = size(current_cluster.start_end_time,1);

distance_matrix = sparse([],[],[],num_cluster,num_cluster);

start_end_d = current_cluster.start_end_time;


for i = 1 : num_cluster
    dist1 = Inf(num_cluster,1);
    dist2 = Inf(num_cluster,1);
    
    idx1 = (start_end_d(i,1) >= start_end_d(:,2));
    idx1(i) = 0;
    
    dist1(idx1) = start_end_d(i,1) - start_end_d(idx1,2);
    
    idx2 = (start_end_d(i,2) <= start_end_d(:,1));
    idx2(i) = 0;

    dist2(idx2) = start_end_d(idx2,1) - start_end_d(i,2);
    
    tempDist = min(dist1,dist2);
    
    usefulIdx = (tempDist <= max_time_gap);
    
    distance_to_be_saved = tempDist(usefulIdx);
    
    distance_to_be_saved(distance_to_be_saved==0) = eps;
    
    distance_matrix(i,usefulIdx) = distance_to_be_saved;
    
    disp(i);
end

current_cluster.distance_matrix = distance_matrix;

current_cluster_with_distance = current_cluster;

save(['cluster_distance_' key '.mat'], 'current_cluster_with_distance','CLUSTER_PARAM');

end

