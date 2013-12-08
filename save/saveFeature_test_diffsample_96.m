function [ suffix ] = saveFeature_test_diffsample_96( main_flag, overlap_flag, ...
    timehist_flag, entropy_flag, mean_flag, var_flag, std_flag, diff_flag, ...
    acc_flag, valhist_flag, fft_count)
%SAVEFEATURE_test_NEW Summary of this function goes here
%   Detailed explanation goes here

assert( nargin == 11);

suffix = getsuffix([main_flag, overlap_flag, ...
    timehist_flag, entropy_flag, mean_flag, var_flag, std_flag, diff_flag, ...
    acc_flag, valhist_flag, 96/fft_count]);

display(suffix);

load('test_feature_main_entropy_6addon_96.mat');
load('test_feature_overlap_timehist.mat');

test_feature_combined = [];

if main_flag
    test_feature_main_sample = [test_feature_main(:,1:fft_count:49) ...
        test_feature_main(:,50:fft_count:98) test_feature_main(:,99:fft_count:147)];
    
    feature_sum = sum(test_feature_main_sample,2);
    feature_sum(find(feature_sum==0)) = 1;
    test_feature_main_sample = bsxfun(@rdivide, test_feature_main_sample, feature_sum);
    
    test_feature_combined = [test_feature_combined, test_feature_main_sample];
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

