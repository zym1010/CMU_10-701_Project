function [ next_cluster ] = next_cluster( cluster, key )
%NEXT_CLUSTER Summary of this function goes here
%   Detailed explanation goes here

global CLUSTER_PARAM

proposed_member_array = cluster.proposed_membership_array;
proposed_member_array_unique = unique(cluster.proposed_membership_array);
start_end_time = cluster.start_end_time;

single_entry_list = [];
preserve_entry_list = [];
for i = 1:length(proposed_member_array_unique)
    
    representative = proposed_member_array_unique(i);
    
    proposed_new_member = find(proposed_member_array==representative);
    
    
    if isscalar(proposed_new_member)
        assert(proposed_new_member==representative);
        single_entry_list(end+1) = proposed_new_member;
    else
        preserve_entry_list(end+1) = representative;
        
        start_end_times = start_end_time(proposed_new_member,:);
        
        % start merging
        [start_time,start_idx] = min(start_end_times(:,1));
        [end_time,end_idx] = max(start_end_times(:,2));
        
        cluster.start_end_time(representative,1) = start_time;
        cluster.start_end_time(representative,2) = end_time;
        
        cluster.start_seg(representative) = cluster.start_seg(proposed_new_member(start_idx));
        cluster.end_seg(representative) = cluster.end_seg(proposed_new_member(end_idx));
        
        % debug
        assert(start_end_time(proposed_new_member(start_idx),1) == start_time);
        assert(start_end_time(proposed_new_member(end_idx),2) == end_time);
        
        % merge seg_cell
        for k = proposed_new_member(:)'
            if k ~= representative
                assert(isempty(intersect(...
                    cluster.seg_cell{representative},cluster.seg_cell{k})));
                
                cluster.seg_cell{representative} = [cluster.seg_cell{representative}(:);...
                    cluster.seg_cell{k}(:)];
            end
        end
        
        
    end
end


next_cluster.start_end_time = cluster.start_end_time(preserve_entry_list,:);
next_cluster.start_seg = cluster.start_seg(preserve_entry_list,:);
next_cluster.end_seg = cluster.end_seg(preserve_entry_list,:);
next_cluster.seg_cell = cluster.seg_cell(preserve_entry_list);

single_entry_clusters = cluster.seg_cell(single_entry_list);


save(['cluster_next_' key '.mat'], 'next_cluster','CLUSTER_PARAM');
save(['cluster_result_' key '.mat'], 'single_entry_clusters','CLUSTER_PARAM');

end

