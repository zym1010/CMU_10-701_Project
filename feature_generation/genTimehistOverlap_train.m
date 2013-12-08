load('feature_time_train_raw.mat');
load('overlap_strict_train.mat');
load('train_numlist.mat');

train_feature_overlap = zeros(77924,1161);
train_feature_timehist = zeros(77924,30);

line_count = 0;

cum_line = cumsum(num_list);

assert(cum_line(end) == 77924);

for i = 1 : 387
    idx = (line_count+1):(line_count+num_list(i));
    line_count = line_count + num_list(i);
    
    idx_old = find(train_label == i);
    
    assert(isequal(idx_old(:),idx(:)));
    
    assert(line_count == cum_line(i));
    
    train_feature_overlap(idx,:) = repmat(overlap_strict_train(i,:),length(idx),1);
    train_feature_timehist(idx,:) = repmat(feature_time_train(i,:),length(idx),1);
    
    disp(i);
end

train_feature_overlap = sparse(train_feature_overlap);

train_feature_timehist = sparse(train_feature_timehist);

save('train_feature_overlap_timehist_raw.mat','train_feature_overlap','train_feature_timehist');