for i = 1 : 100
    load(['test' int2str(i) '.mat']);
    subplot(3,1,1);
    plot(recording(:,1),recording(:,2));
    subplot(3,1,2);
    plot(recording(:,1),recording(:,3));
    subplot(3,1,3);
    plot(recording(:,1),recording(:,4));
    pause
end 