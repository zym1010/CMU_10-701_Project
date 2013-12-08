
feature_time_train = zeros(387,30);

non_zero_count = zeros(387,1);

for i = 1:387
    features_raw = histc(time_diff_train{i},[0:20:600]);
    features_raw = features_raw(1:30);
    features_raw = features_raw./sum(features_raw);
    
    %features_raw(features_raw<(1/15)) = 0;
    
    %features_raw = features_raw./sum(features_raw);
    
    
    feature_time_train(i,:) = features_raw;
    non_zero_count(i) = nnz(features_raw);
    
    
end 