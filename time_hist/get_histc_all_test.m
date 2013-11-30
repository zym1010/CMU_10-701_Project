
feature_time_test = zeros(90024,30);

non_zero_count_test = zeros(90024,1);

for i = 1:90024
    features_raw = histc(time_diff_test{i},[0:20:600]);
    features_raw = features_raw(1:30);
    features_raw = features_raw./sum(features_raw);
    
    features_raw(features_raw<(1/10)) = 0;
    
    features_raw = features_raw./sum(features_raw);
    
    
    feature_time_test(i,:) = features_raw;
    non_zero_count_test(i) = nnz(features_raw);

    disp(i);
end 