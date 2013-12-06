function [ ] = getFeature_test_96()
%GETFEATURE_TRAIN Summary of this function goes here
%   Detailed explanation goes here

global PROJECT_PARAMETER_STRUCT
overlap = PROJECT_PARAMETER_STRUCT.sliding_window_overlap;
window_length = PROJECT_PARAMETER_STRUCT.sliding_window_length;
assert(floor(window_length*overlap) == window_length*overlap); % integer shift
%min_window_length = PROJECT_PARAMETER_STRUCT.min_sliding_window_length;
%maybe useful for testing
variance_threshold = PROJECT_PARAMETER_STRUCT.variance_threshold;

fft_length = PROJECT_PARAMETER_STRUCT.fft_length;

fft_length = 96;

assert(window_length == 64);

window_shift = window_length*(1-overlap);

minimum_sample_per_class = PROJECT_PARAMETER_STRUCT.minimum_sample_per_class_test;

average_over_window = PROJECT_PARAMETER_STRUCT.average_over_window;

featureDir = './test_feature_avg_10s_par_96/';

if ~exist(featureDir, 'dir')
    mkdir(featureDir);
end

load('resample_test_all.mat');
feature_vector_lists = cell(90024,1);
feature_vector_lists_add = cell(90024,1);

entropy_vector_lists = cell(90024,1);


segment_min_point = PROJECT_PARAMETER_STRUCT.segment_min_point_test;
min_segment = PROJECT_PARAMETER_STRUCT.min_segment_test;

segment_min_point = 16; % hack;

parfor i = 1:90024
    resampleRecord = resampleRecords{i};
    
    variance_list = [];
    index_list = [];
    
    fprintf('record %d has %d segments\n',i,length(resampleRecord));
    resampleRecord = getSplitResampleRecord(resampleRecord,segment_min_point,min_segment);
    fprintf('record %d has %d segments\n',i,length(resampleRecord));
    
    for j = 1:length(resampleRecord)
        
        this_record = resampleRecord{j}(:,2:4);
        record_length = size(this_record,1);
        
        % compute how many windows to extract from this segment (record)
        if record_length <= window_length
            window_num = 1;
        else
            window_num = 1 + ceil((record_length-window_length)/window_shift);
        end
        
        % compute variance for each window
        for k = 1:window_num
            this_window = this_record(get_window_k(record_length,window_length,window_shift,k),:);
            variance_list(end+1) = sum(var(this_window,0,1));
            
            index_list = [index_list; j k]; % add index for this variance.
        end
    end % segment loop
    
    % we can collect enough robust windows
    if sum(variance_list>=variance_threshold) >=  minimum_sample_per_class
        index_list = index_list(variance_list>=variance_threshold,:);
    else
        [~,sort_idx] = sort(variance_list,'descend');
        index_list = index_list(sort_idx(1:min(length(sort_idx), minimum_sample_per_class)),:);
    end
    
    
    
    feature_vector_list = zeros(3*(fft_length/2+1),size(index_list,1));
    
    entropy_vector_list = zeros(3,size(index_list,1));
    
    for m = 1:size(index_list,1)
        this_index = index_list(m,:);
        this_record = resampleRecord{this_index(1)}(:,2:4);
        
        record_length = size(this_record,1);
        
        this_window = this_record(get_window_k(record_length,window_length,window_shift,this_index(2)),:);
        
        %assert(size(this_window,1) >= min_window_length);
        
        Y = fft(this_window,fft_length);
        
        this_feature_vector = abs(Y);
        
        this_feature_vector = this_feature_vector(1:(fft_length/2+1),:);
        
        % here, we can some other features
        
        entropy_vector_list(:,m) = computePSDEntropy(this_feature_vector);
        
        
        %this_feature_vector = this_feature_vector ./ repmat( sum(this_feature_vector,1), (fft_length/2+1),1);
        
        counter = 0;
        for kk = 1:3
            if sum(this_feature_vector(1:(fft_length/2+1),kk)) ~= 0
                counter = counter + 1;
                this_feature_vector(1:(fft_length/2+1),kk) = this_feature_vector(1:(fft_length/2+1),kk)/sum(this_feature_vector(1:(fft_length/2+1),kk));
            end
        end
        
        % normalize
        assert(sum(this_feature_vector(:))-counter < 10e-6);
        
        feature_vector_list(:,m) = this_feature_vector(:);
        
        
        
    end
    
    
    included_segments = unique(index_list(:,1));
    
    if average_over_window % combine vectors % caution: there're at least two ways to do normalization...
        
        
%         included_segments = unique(index_list(:,1));
        
        feature_vector_list_avg = zeros(3*(fft_length/2+1),length(included_segments));
        
        entropy_vector_list_avg = zeros(3,length(included_segments));
        
        for mm = 1:length(included_segments)
            index_for_this_seg = (index_list(:,1)==included_segments(mm));
            feature_vector_list_avg(:,mm) = mean(feature_vector_list(:,index_for_this_seg),2);
            
            entropy_vector_list_avg(:,mm) = mean(entropy_vector_list(:,index_for_this_seg),2);
            
        end
        
        feature_vector_list = feature_vector_list_avg;
        
        entropy_vector_list = entropy_vector_list_avg;
        
    end
        
    
    % generate features other than fft
    
    additional_main_feature = generate_additional_main_feature(resampleRecord(included_segments));
    
    
    feature_vector_lists{i} =  feature_vector_list;
    feature_vector_lists_add{i} = additional_main_feature;
    entropy_vector_lists{i} = entropy_vector_list;
    disp(i)
    
end % file loop


save([ featureDir 'feature_main_test_all_96.mat'],'feature_vector_lists',...
    'feature_vector_lists_add','entropy_vector_lists','PROJECT_PARAMETER_STRUCT');

end



function oldRecord = getSplitResampleRecord(oldRecord,segment_min_point,min_segment)

    record_stat = getRecordStat(oldRecord);
    
    while any(record_stat >= (segment_min_point)*2) && ...
        (length(record_stat) < min_segment)
        [maxLength,idx] = max(record_stat);
        
        record_max = oldRecord{idx};
        
        record_first = record_max(1:floor(maxLength/2),:);
        record_last = record_max(floor(maxLength/2)+1:end,:);
        
        oldRecord{idx} = record_first;
        oldRecord{end+1} = record_last;
        
        record_stat = getRecordStat(oldRecord);
        
    end
    
end

function stat = getRecordStat(record)
    stat = zeros(length(record),1);
    
    for i = 1:length(stat)
        stat(i) = size(record{i},1);
    end
end


