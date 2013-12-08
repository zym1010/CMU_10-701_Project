function [ suffixArray ] = saveFeature_batch_diffsample_dummy( numberArray )
%SAVEFEATURE_BATCH Summary of this function goes here
%   Detailed explanation goes here

suffixArray = cell(length(numberArray),1);

for i = 1:length(numberArray)
    numbers = numberArray{i};
    
    suffix = getsuffix([numbers(1:10) 64/numbers(11) ]);    
    suffixArray{i} = suffix;

end

