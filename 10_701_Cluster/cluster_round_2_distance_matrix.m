% load('cluster_round1_norm_robust.mat');
% 
% number_of_groups = length(unique(membershipArray));
% 
% load('start_end_test_double.mat');
% 
% start_end_d_old = start_end_d;
% 
% % start_end_d = zeros(number_of_groups,2);
% 
% error_count = 0;
% error_interval_array = {};
% 
% number_of_groups_new = number_of_groups;
% for i = 1:number_of_groups
%     flag = calc_new_start_end(...
%         start_end_d_old(membershipArray==i,:));
%     
%     if ~flag
%         error_count = error_count+1;
%         error_interval_array{error_count} = find(membershipArray==i);
%         
%         badSegments = find(membershipArray==i);
%         
%         for kk = 2:length(badSegments) % create new groups.
%              number_of_groups_new = number_of_groups_new+1;
%              membershipArray(badSegments(kk)) = number_of_groups_new;
%         end
%         
%     end
%     disp(i);
% end
% 
% 
% 
% error_interval_array = error_interval_array';
% start_end_d = zeros(number_of_groups_new,2);
% 
% for i = 1:number_of_groups_new
%     flag = calc_new_start_end(...
%         start_end_d_old(membershipArray==i,:));
%     
%     assert(flag);
%     
%     [~, start_end_d(i,1), start_end_d(i,2)] = calc_new_start_end(...
%         start_end_d_old(membershipArray==i,:));
%     
% end



distances = sparse([],[],[],number_of_groups_new,number_of_groups_new);

for i = 1 : number_of_groups_new
    dist1 = Inf(number_of_groups_new,1);
    dist2 = Inf(number_of_groups_new,1);
    
    idx1 = (start_end_d(i,1) >= start_end_d(:,2));
    idx1(i) = 0;
    

    dist1(idx1) = start_end_d(i,1) - start_end_d(idx1,2);
    
    idx2 = (start_end_d(i,2) <= start_end_d(:,1));
    idx2(i) = 0;
    
    dist2(idx2) = start_end_d(idx2,1) - start_end_d(i,2);
    
    tempDist = min(dist1,dist2);
    
    [tempDist,distIdx] = sort(tempDist);
    
    distance_to_be_saved = tempDist(1:2);
    
    distance_to_be_saved(distance_to_be_saved==0) = eps;
    
    distances(i,distIdx(1:2)) = distance_to_be_saved;
    
    disp(i);
end

save('distances_round_2.mat', 'distances');
