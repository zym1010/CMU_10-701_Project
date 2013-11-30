for i = 1:387
    bar(histc(time_diff_train{i},[0:20:600]));
    title(int2str(i));
    pause;
end 