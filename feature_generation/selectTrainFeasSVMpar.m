train_feature_all = zeros(77924,99);
train_label = zeros(77924,1);

featureCount = 0;

load('feature_main_train_all.mat');

for i = 1 : 387
    
    featureSize = size(feature_vector_lists{i},2);
    
    train_feature_all(featureCount+1:featureCount+featureSize, :) = feature_vector_lists{i}';
    train_label(featureCount+1:featureCount+featureSize) = i;
    
    disp(i);
    featureCount = featureCount+featureSize;
end

save('train_feature_all_SVM.mat', 'train_feature_all', 'train_label');