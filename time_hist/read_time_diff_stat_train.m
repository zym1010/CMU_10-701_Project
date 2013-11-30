time_diff_train = cell(387,1);


for i = 1:387
    load(['train' int2str(i) '.mat']);
    time_diff_train{i} = diff(recording(:,1));
    disp(i);
end