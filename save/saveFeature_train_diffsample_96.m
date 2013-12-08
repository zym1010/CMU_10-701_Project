function [ suffix ] = saveFeature_train_diffsample_96( main_flag, overlap_flag, ...
    timehist_flag, entropy_flag, mean_flag, var_flag, std_flag, diff_flag, ...
    acc_flag, valhist_flag, fft_count)
%SAVEFEATURE_TRAIN_NEW Summary of this function goes here
%   Detailed explanation goes here

assert( nargin == 11);

suffix = getsuffix([main_flag, overlap_flag, ...
    timehist_flag, entropy_flag, mean_flag, var_flag, std_flag, diff_flag, ...
    acc_flag, valhist_flag, 96/fft_count]);

display(suffix);

load('train_feature_main_entropy_6addon_96.mat');
load('train_feature_overlap_timehist.mat');

train_feature_combined = [];

if main_flag
    train_feature_main_sample = [train_feature_main(:,1:fft_count:49) ...
        train_feature_main(:,50:fft_count:98) train_feature_main(:,99:fft_count:147)];
    
    feature_sum = sum(train_feature_main_sample,2);
    feature_sum(find(feature_sum==0)) = 1;
    train_feature_main_sample = bsxfun(@rdivide, train_feature_main_sample, feature_sum);
    
    train_feature_combined = [train_feature_combined, train_feature_main_sample];
end

if overlap_flag 
    train_feature_combined = [train_feature_combined, train_feature_overlap];
end

if timehist_flag
    train_feature_combined = [train_feature_combined, train_feature_timehist];
end

if entropy_flag
    train_feature_combined = [train_feature_combined, train_feature_entropy];
end

if mean_flag
    train_feature_combined = [train_feature_combined, train_feature_mean];
end

if var_flag
    train_feature_combined = [train_feature_combined, train_feature_var];
end

if std_flag
    train_feature_combined = [train_feature_combined, train_feature_std];
end

if diff_flag
    train_feature_combined = [train_feature_combined, train_feature_diff];
end

if acc_flag
    train_feature_combined = [train_feature_combined, train_feature_acc];
end

if valhist_flag
    train_feature_combined = [train_feature_combined, train_feature_valhist];
end

featureSize = size(train_feature_combined);

display(featureSize);

fprintf('writing %s ... ',suffix);
libsvmwrite(['train_' suffix '.data'], train_label, sparse(train_feature_combined));
fprintf('done\n');

end



