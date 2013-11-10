id_list = zeros(387,1);

for i = 1:387
    load(['train' int2str(i) '.mat']);
    id_list(i) = device_ID;
end