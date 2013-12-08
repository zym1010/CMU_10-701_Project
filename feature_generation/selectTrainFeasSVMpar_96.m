train_feature_main = zeros(77924,147);
train_feature_entropy = zeros(77924,3);
train_feature_mean = zeros(77924,3);
train_feature_var = zeros(77924,3);
train_feature_std = zeros(77924,3);
train_feature_diff = zeros(77924,90);
train_feature_acc = zeros(77924,30);
train_feature_valhist = zeros(77924,90);


train_label = zeros(77924,1);

featureCount = 0;

load('feature_main_train_all_96.mat');

for i = 1 : 387
    
    featureSize = size(feature_vector_lists{i},2);
    
    train_feature_main(featureCount+1:featureCount+featureSize, :) = feature_vector_lists{i}';
    
    train_feature_entropy(featureCount+1:featureCount+featureSize, :) = entropy_vector_lists{i}';
    
    train_feature_mean(featureCount+1:featureCount+featureSize, :) = feature_vector_lists_add{i}{1};
    train_feature_var(featureCount+1:featureCount+featureSize, :) = feature_vector_lists_add{i}{2};
    train_feature_std(featureCount+1:featureCount+featureSize, :) = feature_vector_lists_add{i}{3};
    train_feature_diff(featureCount+1:featureCount+featureSize, :) = feature_vector_lists_add{i}{4};
    train_feature_acc(featureCount+1:featureCount+featureSize, :) = feature_vector_lists_add{i}{5};
    train_feature_valhist(featureCount+1:featureCount+featureSize, :) = feature_vector_lists_add{i}{6};
    

    train_label(featureCount+1:featureCount+featureSize) = i;
    
    disp(i);
    featureCount = featureCount+featureSize;
end




save('train_feature_main_entropy_6addon_96.mat', 'train_feature_main', 'train_feature_entropy',...
    'train_feature_mean', 'train_feature_var','train_feature_std', 'train_feature_diff', ...
    'train_feature_acc', 'train_feature_valhist', 'train_label');