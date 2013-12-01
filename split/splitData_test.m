function splitData_test()

global PROJECT_PARAMETER_STRUCT

splitDir = './test_split_10s_par/';

if ~exist(splitDir, 'dir')
    mkdir(splitDir);
end


load('test_data_all.mat');

splitRecords = cell(90024,1);

parfor j = 1 : 90024
    splitRecord = {};
    
    recording = records{j}.recording;
    
    timeDiff = diff(recording(:,1));

    index = [0; find(timeDiff>=PROJECT_PARAMETER_STRUCT.segmentation_length); size(recording,1)];


    for i = 2 : length(index)
        splitRecord{i-1} = recording(index(i-1)+1:index(i),:);
    end


splitRecords{j} = splitRecord;
    disp(j);
end

save([splitDir 'split_test_all.mat'],'splitRecords','PROJECT_PARAMETER_STRUCT');

end
