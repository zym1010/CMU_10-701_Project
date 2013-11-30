featureNo = zeros(1,387);
for i = 1 : 387
    load(['train_feature' int2str(i) '.mat']);
    featureNo(i) = length(feature_vector_list);
end

save('./train_feature/featureNo.mat', 'featureNo');
    