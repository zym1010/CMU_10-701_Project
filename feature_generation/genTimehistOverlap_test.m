load('feature_time_test.mat');
load('overlap_strict_test.mat');
load('test_numlist.mat');

test_feature_overlap = zeros(426625,1161);
test_feature_timehist = zeros(426625,30);

line_count = 0;

cum_line = cumsum(num_list);

for i = 1 : 90024
    idx = (line_count+1):(line_count+num_list(i));
    line_count = line_count + num_list(i);
    
    assert(line_count == cum_line(i));
    
    test_feature_overlap(idx,:) = repmat(overlap_strict_test(i,:),length(idx),1);
    test_feature_timehist(idx,:) = repmat(feature_time_test(i,:),length(idx),1);
    
    disp(i);
end

test_feature_overlap = sparse(test_feature_overlap);

test_feature_timehist = sparse(test_feature_timehist);

save('test_feature_overlap_timehist.mat','test_feature_overlap','test_feature_timehist');