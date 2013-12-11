function [ flag, new_start, new_end ] = calc_new_start_end( intervals )
%CALC_NEW_START_END Summary of this function goes here
%   Detailed explanation goes here
interval_number  =  size(intervals,1);

flag = true;

for i = 1:interval_number
    for j = i+1:interval_number
        if ~has_no_overlap(intervals(i,:),intervals(j,:))
            flag = false;
            return;
        end
    end
end

new_start = min(intervals(:,1));
new_end = max(intervals(:,2));


end
