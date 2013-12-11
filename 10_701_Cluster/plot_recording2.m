function  plot_recording2( sample1, sample2, start1, start2 )

    sample1.recording(:,1) = sample1.recording(:,1)+start1;
    sample2.recording(:,1) = sample2.recording(:,1)+start2;

    fprintf('%d, %d\n', sample1.recording(end,1), sample2.recording(1,1));
    
    recording = [sample1.recording(end-4:end,:);
                 sample2.recording(1:5,:)];
             
             
    
    subplot(3,1,1);
    hold on;
    plot(recording(1:5,1),recording(1:5,2),'*-r');
    plot(recording(6:10,1),recording(6:10,2),'*-b');
    hold off;
    subplot(3,1,2);
     hold on;
    plot(recording(1:5,1),recording(1:5,3),'*-r');
    plot(recording(6:10,1),recording(6:10,3),'*-b');
    hold off;
    subplot(3,1,3);
    hold on;
    plot(recording(1:5,1),recording(1:5,4),'*-r');
    plot(recording(6:10,1),recording(6:10,4),'*-b');
    %plot(recording(:,1),recording(:,4),'*-r');
    hold off;
end

