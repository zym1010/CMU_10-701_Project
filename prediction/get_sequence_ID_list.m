id_list = zeros(90024,1);

for i = 1:90024
    load(['test' int2str(i) '.mat']);
    id_list(i) = device_ID;
end