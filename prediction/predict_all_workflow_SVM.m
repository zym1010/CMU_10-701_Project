function predict_all_workflow_SVM( suffix )
%PREDICT_ALL_WORKFLOW Summary of this function goes here
%   Detailed explanation goes here
[ prob_estimates_all ] = convertCMDoutputToMAT( [suffix '.svmoutput'] );
test_score = calcBelief_SVM(prob_estimates_all);
test_score = smooth_score(test_score);
getBelief_SVM(test_score, [suffix 'SVM']);

end

