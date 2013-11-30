feature_count = zeros(90024,1);

for i = 1 : 90024
    load(['test_feature' int2str(i) '.mat']);
    feature_count(i) = size(feature_vector_list,2);
    i
end

min(feature_count)
max(feature_count)
mean(feature_count)