function [ current_cluster_with_proposal ] = iterate_cluster_propose( current_cluster, key )
%ITERATE_CLUSTER_PROPOSE Summary of this function goes here
%   Detailed explanation goes here
global CLUSTER_PARAM

max_time_gap = CLUSTER_PARAM.max_time_gap;

num_cluster = size(current_cluster.start_end_time,1);

proposed_membership_array = (1:num_cluster)';

checked = zeros(90024,1);

proposed_join_counter = 0;



for i = 1:num_cluster
    if checked(i)
        continue;
    end
    distance_vector = current_cluster.distance_matrix(i,:);
    
    nnz_value = nonzeros(distance_vector);
    nnz_index = find(distance_vector);
    
    assert(all(nnz_value<=max_time_gap)); % debug
    
    if isempty(nnz_index)
        checked(i) = 1;
        continue;
    end
    
    for j = 1:length(nnz_index)
        % if there's any good candidate index, just put in the candidate
        % list. (proposed_membership_array)
        
        if interval_match(current_cluster,i,nnz_index(j))
            new_group_number = min(proposed_membership_array(i),...
                proposed_membership_array(nnz_index(1)));
            
            proposed_membership_array(nnz_index(j)) = new_group_number;
            proposed_membership_array(i) = new_group_number;
            checked(nnz_index(j)) = 1; % just want to be slow.
            proposed_join_counter = proposed_join_counter+1;
        end
    end
    checked(i) = 1;
    
    disp(i);
end
current_cluster.proposed_membership_array = proposed_membership_array;
current_cluster.proposed_join_counter = proposed_join_counter;
current_cluster_with_proposal = current_cluster;

save(['cluster_propose_' key '.mat'], 'current_cluster_with_proposal','CLUSTER_PARAM');

end

function is_match = interval_match(current_cluster, idx1, idx2)

global CLUSTER_PARAM


start_end_init = load('start_end_test_double_initial.mat');

max_readout_diff = CLUSTER_PARAM.max_readout_diff;

start_end_time = current_cluster.start_end_time([idx1 idx2],:);

assert(has_no_overlap(start_end_time(1,:),...
    start_end_time(2,:)));

assert(all(   (start_end_time(:,2)-start_end_time(:,1))>0   ));

if start_end_time(1,1) >= start_end_time(2,2) % reverse the order
    temp_idx = idx2;
    idx2 = idx1;
    idx1 = temp_idx;
    start_end_time([2 1],:) = start_end_time;
end

assert(start_end_time(2,1)-start_end_time(1,2) <= CLUSTER_PARAM.max_time_gap)

cluster1_end = current_cluster.end_seg(idx1);
cluster2_start = current_cluster.start_seg(idx2);




sample1 = load(['test' int2str(cluster1_end) '.mat']);
sample2 = load(['test' int2str(cluster2_start) '.mat']);

cluster2_end = current_cluster.end_seg(idx2);

sample3 = load(['test' int2str(cluster2_end) '.mat']);


% mind checking
assert(sample1.recording(end,1)+start_end_init.start_end_d(cluster1_end,1)==(start_end_time(1,2)));
assert(sample3.recording(end,1)+start_end_init.start_end_d(cluster2_end,1)==(start_end_time(2,2)));

% checking the variability of readout
read_out_diff = zeros(3,1);

read_out_diff(1) = sample2.recording(1,2)-sample1.recording(end,2);
read_out_diff(2) = sample2.recording(1,3)-sample1.recording(end,3);
read_out_diff(3) = sample2.recording(1,4)-sample1.recording(end,4);

if all(abs(read_out_diff)<=max_readout_diff)
    is_match = true;
else
    is_match = false;
    
end
end