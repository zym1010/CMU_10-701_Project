function predict_all_workflow_prior_SVM( suffix )
%PREDICT_ALL_WORKFLOW Summary of this function goes here
%   Detailed explanation goes here

load('prior_train.mat');

[ prob_estimates_all ] = convertCMDoutputToMAT( [suffix '.svmoutput'] );
test_score = calcBelief_SVM(prob_estimates_all);


for i = 1:90024
    test_score(i,:) = test_score(i,:).*(prior_norm');
    test_score(i,:) = test_score(i,:)./sum(test_score(i,:));
    disp(i);
end

test_score = smooth_score(test_score);
getBelief_SVM(test_score, [suffix 'priorSVM']);

end

