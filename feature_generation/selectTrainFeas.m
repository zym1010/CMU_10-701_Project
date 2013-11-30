train_feature_all = zeros(387*50,99);

for i = 1 : 387
    load(['train_feature' int2str(i) '.mat']);
    
    rng('shuffle');
    feature_num = size(feature_vector_list,2);
    if feature_num >= 50
        selected = randperm(feature_num, 50);
    else
        selected = randi(feature_num,[50, 1]);
    end
    
    new_fea = feature_vector_list(:,selected);
    train_feature_all((50*(i-1)+1):(50*i), :) = new_fea';
    disp(i);
end

save('train_feature_all.mat', 'train_feature_all');