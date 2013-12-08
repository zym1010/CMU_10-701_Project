time_diff_train = cell(387,1);

load('train_data_all.mat');
for i = 1:387
    time_diff_train{i} = diff(records{i}.recording(:,1));
    disp(i);
end