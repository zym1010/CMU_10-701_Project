function splitData()

global PROJECT_PARAMETER_STRUCT

splitDir = './train_split_10s_par/';

if ~exist(splitDir, 'dir')
    mkdir(splitDir);
end

load('train_data_all.mat');

splitRecords = cell(387,1);

parfor j = 1 : 387
    splitRecord = {};

    timeDiff = diff(records{j}.recording(:,1));

    index = [0; find(timeDiff>=PROJECT_PARAMETER_STRUCT.segmentation_length); size(records{j}.recording,1)];


    for i = 2 : length(index)
        splitRecord{i-1} = records{j}.recording(index(i-1)+1:index(i),:);
    end

    splitRecords{j} = splitRecord;
    disp(j);
end

save([splitDir 'split_train_all.mat'],'splitRecords','PROJECT_PARAMETER_STRUCT');

end
