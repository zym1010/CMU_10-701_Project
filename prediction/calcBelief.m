load('kNNresult.mat');
load('test_feature_num.mat');

feature_count = 0;
test_score = zeros(90024,387);

for i = 1 : 90024
    this_score = score((feature_count+1):(feature_count+test_feature_num(i)), :);
    test_score(i,:) =  mean(this_score,1);

    assert(abs(sum(test_score(i,:))-1)<10e-6); 

    feature_count = feature_count + test_feature_num(i);
    
    if mod(i,100) == 0
        disp(i);
    end
end

save('test_score.mat', 'test_score');