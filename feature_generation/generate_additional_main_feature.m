function [ additional_feature ] = generate_additional_main_feature( resampleRecordIncluded )
%GENERATE_ADDITIONAL_MAIN_FEATURE Summary of this function goes here
%   Detailed explanation goes here

% mean, std, variance, average absolute difference, average resultant
% accerleration, histogram of values.

record_number = length(resampleRecordIncluded);

additional_feature = cell(6,1);


additional_feature{1} = zeros(record_number,3);

% mean
for i = 1:record_number
    additional_feature{1}(i,:) = mean(resampleRecordIncluded{i}(:,2:4),1);
end


% var
additional_feature{2} = zeros(record_number,3);

for i = 1:record_number
    additional_feature{2}(i,:) = var(resampleRecordIncluded{i}(:,2:4),0,1);
end


% std
additional_feature{3} = zeros(record_number,3);

for i = 1:record_number
    additional_feature{3}(i,:) = std(resampleRecordIncluded{i}(:,2:4),0,1);
    
    
    assert( sum(abs((additional_feature{3}(i,:)).^2 - additional_feature{2}(i,:))>10e-1) == 0 );
    
end

% average absolute difference

additional_feature{4} = zeros(record_number,3);

for i = 1:record_number
    
    diffed = diff(resampleRecordIncluded{i}(:,2:4),1,1);
    abs_diff = abs(diffed);
    mean_abs_diff = mean(abs_diff,1);
    
    assert(isequal(mean_abs_diff,mean(abs(diff(resampleRecordIncluded{i}(:,2:4),1,1)),1)));
    
    additional_feature{4}(i,:) = mean_abs_diff;
    
end


% average resultant accerleration
additional_feature{5} = zeros(record_number,1);

for i = 1:record_number
    squaredsample = (resampleRecordIncluded{i}(:,2:4)).^2;
    
    root_sum_square = sqrt(sum(squaredsample,2));
    
    
    
%     assert(sum(abs(root_sum_square.^2-sum(squaredsample,2)) > 10e-1)==0);
    
    
    
    additional_feature{5}(i,:) = mean(root_sum_square);
end

% normalized histogram of values. % can consider sparsification
additional_feature{6} = zeros(record_number,90);
for i = 1:record_number
    histc_result = histc(resampleRecordIncluded{i}(:,2:4),-15:15);
    histc_result_chop = histc_result(1:end-1,:);
    
    
%     assert(all(sum(histc_result_chop,1))); % all non-zero
%     
%     
    for k = 1:3
        if sum(histc_result_chop(:,k)) == 0
            additional_feature{6}(i,k*30-29:k*30) = 0;
        else
            additional_feature{6}(i,k*30-29:k*30) = histc_result_chop(:,k)./sum(histc_result_chop(:,k));
        end
    end
end


end

