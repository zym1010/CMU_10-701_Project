function splitData2_test()
%SPLITDATA2 delete the segments with length less than 6400


global PROJECT_PARAMETER_STRUCT

splitDir2 = './test_split2_10s/';

if ~exist(splitDir2, 'dir')
    mkdir(splitDir2);
end

for i = 1 : 90024
    splitRecord2 = {};
    load(['test' int2str(i) 's.mat']);
    
    length_list = zeros(length(splitRecord2),1);
    
    parfor j = 1 : length(splitRecord)
        
        length_list(j) = splitRecord{j}(end,1) - splitRecord{j}(1,1); % remember length

    end
    
    if any(length_list >= PROJECT_PARAMETER_STRUCT.segment_min_length_test)
        splitRecord2 = splitRecord(length_list >= PROJECT_PARAMETER_STRUCT.segment_min_length_test);
    else
        [~,index] = max(length_list);
        splitRecord2 = splitRecord(index);
    end
    
    
    fileDir = [splitDir2 'test' int2str(i) 'ss.mat'];
    save(fileDir, 'splitRecord2');
    i
end


end

