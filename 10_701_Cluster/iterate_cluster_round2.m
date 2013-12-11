load('distances_round_2.mat');

membershipArray = zeros(45983,1);
% 
membershipArray(:,1) = 1:45983;

checked = zeros(45983,1);
% near_distance_all = zeros(90024,2);

join_thres = 500;

% load('start_end_test_double.mat');

% read_out_diff = zeros(3,1);

join_counter = 0;
% reject_join_counter = 0;
for i = 1:45983
    if checked(i)
        continue;
    end
    
    distance_vector = distances(i,:);
    
    non_zeros = nonzeros(distance_vector);
    
    assert(length(non_zeros) == 2);
    
    non_zeros_idx = find(distance_vector);
    
    [non_zeros, sort_idx] = sort(non_zeros);
    non_zeros_idx_sorted = non_zeros_idx(sort_idx);
    
    if non_zeros(1) <= join_thres % eligible for joining
        
        
%         % check if this is good joining
%         idx1=i;
%         idx2=non_zeros_idx_sorted(1);
%         
%         sample1 = load(['test' int2str(idx1) '.mat']);
%         sample2 = load(['test' int2str(idx2) '.mat']);
%         
%         start_end_time = start_end_d([idx1 idx2],:);
%         
%         assert((start_end_time(1,1) >= start_end_time(2,2)) ...
%             || (start_end_time(2,1) >= start_end_time(1,2))  );
%         
%         if start_end_time(1,1) >= start_end_time(2,2)
%             temp_sample = sample2;
%             sample2 = sample1;
%             sample1 = temp_sample;
%             
%             start_end_time([2 1],:) = start_end_time;
%             
%         end
%         
%         if non_zeros(1) == eps
%             non_zeros(1) = 0;
%         end
%         
%         %         assert(sample1.recording(end,1)+start_end_time(1,1)==(start_end_time(1,2)));
%         %         assert(sample2.recording(end,1)+start_end_time(2,1)==(start_end_time(2,2)));
%         %         assert(sample2.recording(1,1)+start_end_time(2,1)-(start_end_time(1,2))==non_zeros(1));
%         %
%         read_out_diff(1) = sample2.recording(1,2)-sample1.recording(end,2);
%         read_out_diff(2) = sample2.recording(1,3)-sample1.recording(end,3);
%         read_out_diff(3) = sample2.recording(1,4)-sample1.recording(end,4);
%         
%         if all(abs(read_out_diff)<=1) %only consider very reliable ones
            
            fprintf('joining %d and %d\n',i,non_zeros_idx_sorted(1));
            new_group_number = min(membershipArray(i),membershipArray(non_zeros_idx_sorted(1)));
            
            membershipArray(non_zeros_idx_sorted(1)) = new_group_number;
            membershipArray(i) = new_group_number;
            checked(non_zeros_idx_sorted(1)) = 1;
            join_counter = join_counter+1;
%         else
%             fprintf('reject joining %d and %d\n',i,non_zeros_idx_sorted(1));
%             reject_join_counter = reject_join_counter + 1;
%         end
        %add this member to i's group
    end
    
    checked(i) = 1;
    i
end