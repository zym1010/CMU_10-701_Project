load('test_feature_all.mat');
load('overlap_test_s.mat');
% load('quantiles_test.mat');
load('test_feature_num.mat');

segment_num = size(test_feature_all,1);

test_label = ones(segment_num,1);

fft_quantile_overlap_test = zeros(segment_num, 99+387*3);

fft_quantile_overlap_test(:,1:99) = test_feature_all;

line_count = 0;

cum_line = cumsum(test_feature_num);

for i = 1 : 90024
    idx = (line_count+1):(line_count+test_feature_num(i));
    line_count = line_count + test_feature_num(i);
    
    assert(line_count == cum_line(i));
    
%     fft_quantile_overlap_test(idx,100:104) = repmat(quantiles(i,3:7),length(idx),1);
    fft_quantile_overlap_test(idx,100:(99+387)) = repmat(overlap_testX(i,:),length(idx),1);
    fft_quantile_overlap_test(idx,(100+387):(99+387*2)) = repmat(overlap_testY(i,:),length(idx),1);
    fft_quantile_overlap_test(idx,(100+387*2):(99+387*3)) = repmat(overlap_testZ(i,:),length(idx),1);
    
    disp(i);
end

libsvmwrite('test_feature_2sets_sparse.txt',test_label,sparse(fft_quantile_overlap_test));
