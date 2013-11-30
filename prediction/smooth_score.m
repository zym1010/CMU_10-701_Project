load('test_score_SVM.mat');

for i = 1:length(big_result)
    test_score(big_result{i},:) = repmat(mean(test_score(big_result{i},:),1), ...
        length(big_result{i}),1 );
    i
end

save('test_score_SVM_smooth.mat','test_score');