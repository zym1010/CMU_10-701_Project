segmentNo = zeros(1,387);
for i = 1 : 387
    load(['train' int2str(i) 'ss.mat']);
    segmentNo(i) = length(splitRecord2);
end

save('./train_split2/segmentNo.mat', 'segmentNo');
    