test_feature_num = zeros(90024,1);

for i = 1 : 90024
    load(['test_feature' int2str(i) '.mat']);
    test_feature_num(i) = size(feature_vector_list, 2);
    if mod(i,100) == 0
        disp(i);
    end
end

save('test_feature_num.mat', 'test_feature_num');