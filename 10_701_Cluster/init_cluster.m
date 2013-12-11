function [ current_cluster ] = init_cluster(  )
%INIT_CLUSTER Summary of this function goes here
%   Detailed explanation goes here

load('start_end_test_double_initial.mat');

init_cluster.start_end_time = start_end_d;

init_cluster.start_seg = (1:90024)';
init_cluster.end_seg = (1:90024)';

init_cluster.seg_cell = cell(90024,1);

for i = 1:90024
    init_cluster.seg_cell{i} = i;
end

current_cluster = init_cluster;

save('cluster_init.mat','current_cluster');

end

