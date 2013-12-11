function [ validated_cluster ] = validate_proposed_cluster( cluster, key )
%VALIDATE_PROPOSED_CLUSTER Summary of this function goes here
%   Detailed explanation goes here

global CLUSTER_PARAM

proposed_member_array = cluster.proposed_membership_array;
proposed_member_array_unique = unique(cluster.proposed_membership_array);
start_end_d = cluster.start_end_time;


merge_reject_counter = 0;
merge_approve_counter = 0;
for i = 1:length(proposed_member_array_unique)
    proposed_new_member = find(proposed_member_array==proposed_member_array_unique(i));
    
    % the member itself is excluded.
%     proposed_new_member = setdiff(proposed_new_member,proposed_member_array_unique(i));
    
% check if there's overlap
    start_end_times = start_end_d(proposed_new_member,:);
    
    if ~has_no_overlap_big(start_end_times) % not mergable
         fprintf('not mergable!\n');
         merge_reject_counter = merge_reject_counter+1;
         
         
         %debug
         for k = 1:length(proposed_new_member)
              if proposed_new_member(k) ~= proposed_member_array_unique(i)
                  assert(sum( proposed_member_array==proposed_new_member(k) )==0);
              end
         end
         
         proposed_member_array(proposed_new_member) = proposed_new_member;
         
    else
        
        fprintf('mergable!\n');
        merge_approve_counter = merge_approve_counter+1;
    end
end

cluster.proposed_membership_array = proposed_member_array;
cluster.merge_reject_counter = merge_reject_counter;
cluster.merge_approve_counter = merge_approve_counter;
validated_cluster = cluster;

save(['cluster_validate_' key '.mat'], 'validated_cluster','CLUSTER_PARAM');


end

