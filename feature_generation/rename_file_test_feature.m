featureDir = './test_feature_avg_10s/';


for i = 1:90024
    movefile([featureDir 'train_feature' int2str(i) '.mat'],...
        [featureDir 'test_feature' int2str(i) '.mat']);
    i
end