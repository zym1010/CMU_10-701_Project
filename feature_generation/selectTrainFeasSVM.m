train_feature_all = zeros(77924,99);
train_label = zeros(77924,1);


featureCount = 0;


for i = 1 : 387
    load(['train_feature' int2str(i) '.mat']);
    
    featureSize = size(feature_vector_list,2);
    
    train_feature_all(featureCount+1:featureCount+featureSize, :) = feature_vector_list';
    train_label(featureCount+1:featureCount+featureSize) = i;
    
    disp(i);
    featureCount = featureCount+featureSize;
end

save('train_feature_all_SVM.mat', 'train_feature_all', 'train_label');