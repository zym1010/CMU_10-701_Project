feature_count = 0;

for i = 1 : 387
    load(['train_feature' int2str(i) '.mat']);
    feature_count = feature_count+ size(feature_vector_list,2);
    i
end

