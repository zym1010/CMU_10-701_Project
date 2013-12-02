function test_score = calcBelief_SVM(prob_estimates_all)

load('test_numlist.mat');

feature_count = 0;
test_score = zeros(90024,387);

for i = 1 : 90024
    this_score = prob_estimates_all((feature_count+1):(feature_count+num_list(i)), :);
    test_score(i,:) =  mean(this_score,1);

    assert(abs(sum(test_score(i,:))-1)<10e-5); 

    feature_count = feature_count + num_list(i);
    
    if mod(i,100) == 0
        disp(i);
    end
end

end