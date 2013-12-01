function splitData2_test()
%SPLITDATA2 delete the segments with length less than 6400


global PROJECT_PARAMETER_STRUCT

splitDir2 = './test_split2_10s_par/';

if ~exist(splitDir2, 'dir')
    mkdir(splitDir2);
end

load('split_test_all.mat');

init_parameters;

splitRecords2 = cell(90024,1);

parfor i = 1 : 90024
    splitRecord2 = {};
    
    
    splitRecord = splitRecords{i};
    
    length_list = zeros(length(splitRecord),1);
    
    for j = 1 : length(splitRecord)
        
        length_list(j) = splitRecord{j}(end,1) - splitRecord{j}(1,1); % remember length

    end
    
    if any(length_list >= PROJECT_PARAMETER_STRUCT.segment_min_length_test)
        splitRecord2 = splitRecord(length_list >= PROJECT_PARAMETER_STRUCT.segment_min_length_test);
    else
        [~,index] = max(length_list);
        splitRecord2 = splitRecord(index);
    end
    
    
    
    splitRecords2{i} = splitRecord2;
    disp(i);
end

save([splitDir2 'split2_test_all.mat'],'splitRecords2','PROJECT_PARAMETER_STRUCT');

end

