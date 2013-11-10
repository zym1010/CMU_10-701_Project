

function splitData()

global PROJECT_PARAMETER_STRUCT

splitDir = './train_split/';

if ~exist(splitDir, 'dir')
    mkdir(splitDir);
end

for j = 1 : 387
    splitRecord = {};
    load(['train' int2str(j) '.mat']);
    timeDiff = diff(recording(:,1));

    index = [0; find(timeDiff>=PROJECT_PARAMETER_STRUCT.segmentation_length); size(recording,1)];


    for i = 2 : length(index)
        splitRecord{i-1} = recording(index(i-1)+1:index(i),:);
    end

    fileName = [splitDir 'train' int2str(j) 's.mat'];
    save(fileName, 'splitRecord');
    disp(j);
end