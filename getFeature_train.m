function [ ] = getFeature_train()
%GETFEATURE_TRAIN Summary of this function goes here
%   Detailed explanation goes here

global PROJECT_PARAMETER_STRUCT
overlap = PROJECT_PARAMETER_STRUCT.sliding_window_overlap;
window_length = PROJECT_PARAMETER_STRUCT.sliding_window_length;
assert(floor(window_length*overlap) == window_length*overlap); % integer shift
min_window_length = PROJECT_PARAMETER_STRUCT.min_sliding_window_length;
%maybe useful for testing
variance_threshold = PROJECT_PARAMETER_STRUCT.variance_threshold;

fft_length = PROJECT_PARAMETER_STRUCT.fft_length;


window_shift = window_length*(1-overlap);

minimum_sample_per_class = PROJECT_PARAMETER_STRUCT.minimum_sample_per_class;


average_over_window = PROJECT_PARAMETER_STRUCT.average_over_window;

featureDir = './train_feature_avg/';

if ~exist(featureDir, 'dir')
    mkdir(featureDir);
end

for i = 1:387
    load(['train' int2str(i) 'r' '.mat']);
    
    variance_list = [];
    index_list = [];
    
    
    
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
    
    for m = 1:size(index_list,1)
        this_index = index_list(m,:);
        this_record = resampleRecord{this_index(1)}(:,2:4);
        
        record_length = size(this_record,1);
        
        this_window = this_record(get_window_k(record_length,window_length,window_shift,this_index(2)),:);
        
        assert(size(this_window,1) >= min_window_length);
        
        Y = fft(this_window,fft_length);
        
        this_feature_vector = abs(Y);
        
        this_feature_vector = this_feature_vector(1:(fft_length/2+1),:);
        
        
        
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
    
    
    
    if average_over_window % combine vectors % caution: there're at least two ways to do normalization...
        
        
        included_segments = unique(index_list(:,1));
        
        feature_vector_list_avg = zeros(3*(fft_length/2+1),length(included_segments));
        
        
        for mm = 1:length(included_segments)
            index_for_this_seg = (index_list(:,1)==included_segments(mm));
            feature_vector_list_avg(:,mm) = sum(feature_vector_list(:,index_for_this_seg),2);
        end
        
        feature_vector_list = feature_vector_list_avg;
    end
        
    
    save([ featureDir 'train_feature' int2str(i) '.mat'], 'feature_vector_list');
    
    i
    
end % file loop


end

