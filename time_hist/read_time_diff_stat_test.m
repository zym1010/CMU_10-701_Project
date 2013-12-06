time_diff_test = cell(90024,1);

load('test_data_all.mat');

for i = 1:90024
    time_diff_test{i} = diff(records{i}.recording(:,1));
    disp(i);
end