test_feature_all = zeros(426625,99);

row_count = 0;

load('feature_main_test_all.mat');

num_list = zeros(90024,1);

for i = 1 : 90024
    num_list(i) = size(feature_vector_lists{i}, 2);
    i
end
    

for i = 1 : 90024

    rows = size(feature_vector_lists{i}, 2);
    test_feature_all(row_count+1:row_count+rows, :) = feature_vector_lists{i}';
    row_count = row_count + rows;
    
    disp(i)

end


save('test_feature_all.mat', 'test_feature_all');