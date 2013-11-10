sampleLen = [];

for i = 1 : 387
    load(['train' int2str(i) 's.mat']);
    for j = 1 : length(splitRecord)
        if size(splitRecord{j},1) == 1
            continue;
        end
        sampleLen(end+1) = splitRecord{j}(end,1) - splitRecord{j}(1,1);
    end
end

save('sampleLen.mat', 'sampleLen');