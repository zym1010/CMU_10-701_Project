load('alleged_device_ID_list.mat');
load('cluster_next_round3.mat');

%alleged_device_ID_list

seg_cell = next_cluster.seg_cell;

grouped_alleged_list = cell(14,1);
grouped_alleged_list_unique = cell(14,1);

for i = 1:14
    group_alleged_list{i} = sort(alleged_device_ID_list(seg_cell{i}));
    grouped_alleged_list_unique{i} = unique(group_alleged_list{i} );
end

