time_diff_test = cell(90024,1);

load('test_data_raw_all.mat');

parfor i = 1:90024
    time_diff_test{i} = diff(test_data{i}.recording(:,1));
    disp(i);
end