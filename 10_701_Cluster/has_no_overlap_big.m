function flag = has_no_overlap_big (intervals)

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

end