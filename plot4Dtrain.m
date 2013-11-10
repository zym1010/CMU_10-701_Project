function plot4Dtrain(name)
load(['train' int2str(name) '.mat'])

for i = 0 : 100
    subplot(3,1,1);
    plot(recording(300*i+1:300*i+300,1), recording(300*i+1:300*i+300,2));
    subplot(3,1,2);
    plot(recording(300*i+1:300*i+300,1), recording(300*i+1:300*i+300,3));
    subplot(3,1,3);
    plot(recording(300*i+1:300*i+300,1), recording(300*i+1:300*i+300,4));
    pause
end