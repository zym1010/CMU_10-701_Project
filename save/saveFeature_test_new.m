function [ suffix ] = saveFeature_test_new( main_flag, overlap_flag, ...
    timehist_flag, entropy_flag, mean_flag, var_flag, std_flag, diff_flag, ...
    acc_flag, valhist_flag)
%SAVEFEATURE_test_NEW Summary of this function goes here
%   Detailed explanation goes here

assert( nargin == 10);

suffix = getsuffix([main_flag, overlap_flag, ...
    timehist_flag, entropy_flag, mean_flag, var_flag, std_flag, diff_flag, ...
    acc_flag, valhist_flag]);

display(suffix);

load('test_feature_main_entropy_6addon.mat');
load('test_feature_overlap_timehist.mat');

test_feature_combined = [];

if main_flag
    test_feature_combined = [test_feature_combined, test_feature_main];
end

if overlap_flag 
    test_feature_combined = [test_feature_combined, test_feature_overlap];
end

if timehist_flag
    test_feature_combined = [test_feature_combined, test_feature_timehist];
end

if entropy_flag
    test_feature_combined = [test_feature_combined, test_feature_entropy];
end

if mean_flag
    test_feature_combined = [test_feature_combined, test_feature_mean];
end

if var_flag
    test_feature_combined = [test_feature_combined, test_feature_var];
end

if std_flag
    test_feature_combined = [test_feature_combined, test_feature_std];
end

if diff_flag
    test_feature_combined = [test_feature_combined, test_feature_diff];
end

if acc_flag
    test_feature_combined = [test_feature_combined, test_feature_acc];
end

if valhist_flag
    test_feature_combined = [test_feature_combined, test_feature_valhist];
end

featureSize = size(test_feature_combined);

display(featureSize);

fprintf('writing %s ... ',suffix);
libsvmwrite(['test_' suffix '.data'], test_label, sparse(test_feature_combined));
fprintf('done\n');

end

