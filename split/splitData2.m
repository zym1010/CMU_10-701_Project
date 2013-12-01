function splitData2()
%SPLITDATA2 delete the segments with length less than 6400
global PROJECT_PARAMETER_STRUCT

splitDir2 = './train_split2_10s_par/';



if ~exist(splitDir2, 'dir')
    mkdir(splitDir2);
end

load('split_train_all.mat');

splitRecords2 = cell(387,1);

parfor i = 1 : 387
    splitRecord2 = {};
    recordNo = 1;
    
    
    
    for j = 1 : length(splitRecords{i})
        if (splitRecords{i}{j}(end,1) - splitRecords{i}{j}(1,1) >= PROJECT_PARAMETER_STRUCT.segment_min_length) %...
                %&& (splitRecord{j}(end,1) - splitRecord{j}(1,1) <= PROJECT_PARAMETER_STRUCT.segment_max_length)
            splitRecord2{recordNo} = splitRecords{i}{j};
            recordNo = recordNo + 1;
        end
    end
    

    splitRecords2{i} = splitRecord2;
    
    disp(i);
end


save([splitDir2 'split2_train_all.mat'],'splitRecords2','PROJECT_PARAMETER_STRUCT');

end

