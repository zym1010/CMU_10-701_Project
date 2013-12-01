function resample_test( )
%RESAMPLE Resamples the training and testing data with certain time
%interval

global PROJECT_PARAMETER_STRUCT

interval = PROJECT_PARAMETER_STRUCT.sampling_rate;

trainDir = './test_resample_10s_par/';

if ~exist(trainDir, 'dir')
    mkdir(trainDir);
end

load('split2_test_all.mat');

resampleRecords = cell(90024,1);

parfor i = 1 : 90024
    resampleRecord = {};
    
    splitRecord2 = splitRecords2{i};
    
    for j = 1 : length(splitRecord2)
        splitRecord2{j}(:,1) = splitRecord2{j}(:,1) - splitRecord2{j}(1,1);
        pointNo = floor(splitRecord2{j}(end,1) / interval);
        lastPoint = pointNo * interval;
        resampleRecord{j} = zeros(pointNo+1, 4);
        resampleRecord{j}(:,1) = 0:interval:lastPoint;
        [~,ia,~] = unique(splitRecord2{j}(:,1));
        resampleRecord{j}(:,2) = spline(splitRecord2{j}(ia,1), splitRecord2{j}(ia,2), resampleRecord{j}(:,1));
        resampleRecord{j}(:,3) = spline(splitRecord2{j}(ia,1), splitRecord2{j}(ia,3), resampleRecord{j}(:,1));
        resampleRecord{j}(:,4) = spline(splitRecord2{j}(ia,1), splitRecord2{j}(ia,4), resampleRecord{j}(:,1));
        
    end
    resampleRecords{i} = resampleRecord;
    disp(i);
end

save([trainDir 'resample_test_all.mat'],'resampleRecords','PROJECT_PARAMETER_STRUCT')


end