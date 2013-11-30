test_feature_all = zeros(426625,99);

row_count = 0;
for i = 1 : 90024
    load(['test_feature' int2str(i) '.mat']);
    rows = size(feature_vector_list, 2);
    test_feature_all(row_count+1:row_count+rows, :) = feature_vector_list';
    row_count = row_count + rows;
    
    if mod(i, 100) == 0
        disp(i)
    end
end

save('test_feature_all.mat', 'test_feature_all');