segmentNo = zeros(90024,1);
for i = 1 : 90024
    load(['test' int2str(i) 'ss.mat']);
    segmentNo(i) = length(splitRecord2);
    disp(i);
end

save('./test_split2/segmentNo.mat', 'segmentNo');
    