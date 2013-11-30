function plot4Dtrains(sampleNo)

load(['train' int2str(sampleNo) 's.mat']);
for i = 1 : 100
    subplot(3,1,1);
    plot(splitRecord{i}(:,1),splitRecord{i}(:,2));
    title(int2str(i));
    subplot(3,1,2);
    plot(splitRecord{i}(:,1),splitRecord{i}(:,3));
    subplot(3,1,3);
    plot(splitRecord{i}(:,1),splitRecord{i}(:,4));
    pause
end 