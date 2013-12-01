function resample( )
%RESAMPLE Resamples the training and testing data with certain time
%interval

global PROJECT_PARAMETER_STRUCT

interval = PROJECT_PARAMETER_STRUCT.sampling_rate;

trainDir = './train_resample_10s_par/';

if ~exist(trainDir, 'dir')
    mkdir(trainDir);
end

load('split2_train_all.mat');

resampleRecords = cell(387,1);

parfor i = 1 : 387
    resampleRecord = {};
    
    for j = 1 : length(splitRecords2{i})
        splitRecords2{i}{j}(:,1) = splitRecords2{i}{j}(:,1) - splitRecords2{i}{j}(1,1);
        pointNo = floor(splitRecords2{i}{j}(end,1) / interval);
        lastPoint = pointNo * interval;
        resampleRecord{j} = zeros(pointNo+1, 4);
        resampleRecord{j}(:,1) = 0:interval:lastPoint;
        [~,ia,~] = unique(splitRecords2{i}{j}(:,1));
        resampleRecord{j}(:,2) = spline(splitRecords2{i}{j}(ia,1), splitRecords2{i}{j}(ia,2), resampleRecord{j}(:,1));
        resampleRecord{j}(:,3) = spline(splitRecords2{i}{j}(ia,1), splitRecords2{i}{j}(ia,3), resampleRecord{j}(:,1));
        resampleRecord{j}(:,4) = spline(splitRecords2{i}{j}(ia,1), splitRecords2{i}{j}(ia,4), resampleRecord{j}(:,1));
        
    end
    resampleRecords{i} = resampleRecord;
    disp(i);
end

save([trainDir 'resample_train_all.mat'],'resampleRecords','PROJECT_PARAMETER_STRUCT')

end