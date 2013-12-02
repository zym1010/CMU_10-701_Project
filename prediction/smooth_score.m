function test_score = smooth_score(test_score)

load('aggregate_smooth_result.mat');

for i = 1:length(big_result)
    test_score(big_result{i},:) = repmat(mean(test_score(big_result{i},:),1), ...
        length(big_result{i}),1 );
    disp(i);
end

end