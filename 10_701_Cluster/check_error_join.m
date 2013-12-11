function [] = check_error_join(group_number,samplenum1,samplenum2)

load('start_end_test_double.mat');
load('error_interval_array_round1.mat');
sample_idx = error_interval_array{group_number};

samples = cell(length(sample_idx),1);

for i = 1:length(samples)
    samples{i} = load(['test' int2str(sample_idx(i)) '.mat']);
end

start_end_time = start_end_d(sample_idx,:);

if nargin == 1
    display(sample_idx);
    display(start_end_time);
else
    plot_recording2(samples{samplenum1},samples{samplenum2},...
        start_end_time(samplenum1,1),start_end_time(samplenum2,1));
end

end