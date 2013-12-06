function [ suffixArray ] = saveFeature_batch_dummy( numberArray )
%SAVEFEATURE_BATCH Summary of this function goes here
%   Detailed explanation goes here

suffixArray = cell(length(numberArray),1);

for i = 1:length(numberArray)
    numbers = numberArray{i};
    suffix = getsuffix(numbers);
%     suffix = saveFeature_train_new(numbers(1), numbers(2),...
%         numbers(3),numbers(4), numbers(5), numbers(6), numbers(7),...
%         numbers(8), numbers(9), numbers(10));
%     
%     saveFeature_test_new(numbers(1), numbers(2),...
%         numbers(3),numbers(4), numbers(5), numbers(6), numbers(7),...
%         numbers(8), numbers(9), numbers(10));
%     
    suffixArray{i} = suffix;

end

