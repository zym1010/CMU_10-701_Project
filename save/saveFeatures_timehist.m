load('train_feature_all_SVM.mat');
load('overlap_train_s.mat');
load('feature_time_train.mat');
% load('quantiles.mat');


fft_quantile_overlap = zeros(length(train_label), 99+387*3+30);

fft_quantile_overlap(:,1:99) = train_feature_all;

for i = 1 : 387
    idx = find(train_label == i);
%     fft_quantile_overlap(idx,100:104) = repmat(quantiles(i,3:7),length(idx),1);
    fft_quantile_overlap(idx,100:99+387*3) = repmat(overlap_strict_train(i,:),length(idx),1);
    fft_quantile_overlap(idx,100+387*3:end) = repmat(feature_time_train(i,:),length(idx),1);

%    fft_quantile_overlap(idx,(110+387):(109+387*2)) = repmat(overlap(i,:,2),length(idx),1);
%     fft_quantile_overlap(idx,(110+387*2):(109+387*3)) = repmat(overlap(i,:,3),length(idx),1);
    
    disp(i);
end

libsvmwrite('train_feature_2sets_sparse_timehist.txt',train_label,sparse(fft_quantile_overlap));

% save('train_feature_2sets_sparse.mat', 'fft_quantile_overlap', 'train_label');