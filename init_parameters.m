global PROJECT_PARAMETER_STRUCT

PROJECT_PARAMETER_STRUCT.segmentation_length = 10000; % relatively stable.

PROJECT_PARAMETER_STRUCT.segment_min_length = 4800; % rather arbitrary.


PROJECT_PARAMETER_STRUCT.segment_min_length_test = 2400; % rather arbitrary.

PROJECT_PARAMETER_STRUCT.sampling_rate = 200; % very stable

PROJECT_PARAMETER_STRUCT.min_segment = 50;

PROJECT_PARAMETER_STRUCT.min_segment_test = 5;

PROJECT_PARAMETER_STRUCT.segment_min_point = floor(PROJECT_PARAMETER_STRUCT.segment_min_length...
    /PROJECT_PARAMETER_STRUCT.sampling_rate); %

PROJECT_PARAMETER_STRUCT.segment_min_point_test = floor(PROJECT_PARAMETER_STRUCT.segment_min_length_test...
    /PROJECT_PARAMETER_STRUCT.sampling_rate); %

PROJECT_PARAMETER_STRUCT.variance_threshold = 0.08; % rather arbitrary.

PROJECT_PARAMETER_STRUCT.sliding_window_length = 64;
PROJECT_PARAMETER_STRUCT.fft_length = PROJECT_PARAMETER_STRUCT.sliding_window_length; % very arbitrary.

PROJECT_PARAMETER_STRUCT.min_sliding_window_length = 8; % maybe useful for testing

PROJECT_PARAMETER_STRUCT.sliding_window_overlap = 0.5; % very arbitrary.


PROJECT_PARAMETER_STRUCT.minimum_sample_per_class = 75; % lower threshold on variance to satisfy this if necessary.
% however, if there aren't too much data after split_data2 (e.g. only 8
% segments), then use that smaller number instead.

PROJECT_PARAMETER_STRUCT.minimum_sample_per_class_test = 5;

PROJECT_PARAMETER_STRUCT.average_over_window = true;