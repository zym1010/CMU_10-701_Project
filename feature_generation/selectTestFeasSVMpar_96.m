test_feature_main = zeros(426625,147);
test_feature_entropy = zeros(426625,3);
test_feature_mean = zeros(426625,3);
test_feature_var = zeros(426625,3);
test_feature_std = zeros(426625,3);
test_feature_diff = zeros(426625,90);
test_feature_acc = zeros(426625,30);
test_feature_valhist = zeros(426625,90);


test_label = ones(426625,1);

featureCount = 0;

load('feature_main_test_all_96.mat');

for i = 1 : 90024
    
    featureSize = size(feature_vector_lists{i},2);
    
    test_feature_main(featureCount+1:featureCount+featureSize, :) = feature_vector_lists{i}';
    
    test_feature_entropy(featureCount+1:featureCount+featureSize, :) = entropy_vector_lists{i}';
    
    test_feature_mean(featureCount+1:featureCount+featureSize, :) = feature_vector_lists_add{i}{1};
    test_feature_var(featureCount+1:featureCount+featureSize, :) = feature_vector_lists_add{i}{2};
    test_feature_std(featureCount+1:featureCount+featureSize, :) = feature_vector_lists_add{i}{3};
    test_feature_diff(featureCount+1:featureCount+featureSize, :) = feature_vector_lists_add{i}{4};
    test_feature_acc(featureCount+1:featureCount+featureSize, :) = feature_vector_lists_add{i}{5};
    test_feature_valhist(featureCount+1:featureCount+featureSize, :) = feature_vector_lists_add{i}{6};
    

    %test_label(featureCount+1:featureCount+featureSize) = i;
    
    disp(i);
    featureCount = featureCount+featureSize;
end




save('test_feature_main_entropy_6addon_96.mat', 'test_feature_main', 'test_feature_entropy',...
    'test_feature_mean', 'test_feature_var','test_feature_std', 'test_feature_diff', ...
    'test_feature_acc', 'test_feature_valhist', 'test_label');