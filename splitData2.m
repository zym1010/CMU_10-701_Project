function splitData2()
%SPLITDATA2 delete the segments with length less than 6400
global PROJECT_PARAMETER_STRUCT

splitDir2 = './train_split2/';

if ~exist(splitDir2, 'dir')
    mkdir(splitDir2);
end

for i = 1 : 387
    splitRecord2 = {};
    load(['train' int2str(i) 's.mat']);
    recordNo = 1;
    for j = 1 : length(splitRecord)
        if splitRecord{j}(end,1) - splitRecord{j}(1,1) >= PROJECT_PARAMETER_STRUCT.segment_min_length
            splitRecord2{recordNo} = splitRecord{j};
            recordNo = recordNo + 1;
        end
    end
    fileDir = [splitDir2 'train' int2str(i) 'ss.mat'];
    save(fileDir, 'splitRecord2');
end


end

