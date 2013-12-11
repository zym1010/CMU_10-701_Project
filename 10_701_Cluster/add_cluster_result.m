result = cell(3,1);

for i = 1:3
    result{i} = load(['cluster_result_round' int2str(i) '.mat']);
end

big_result = {};

for i = 1:3
    big_result = [big_result; result{i}.single_entry_clusters];
end

final_result = load('cluster_next_round3.mat');

big_result = [big_result; final_result.next_cluster.seg_cell];