for i = 1:90024
    bar(histc(time_diff_test{i},[0:20:600]));
    title(int2str(i));
    pause;
end 