number_of_sample = uint64(0);

for i = 1:386
    current_sample = load(['train' int2str(i) '.mat']);
    number_of_sample = number_of_sample+uint64(size(current_sample.recording,1));
end


