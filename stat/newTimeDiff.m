function newTimeDiff()
%NEWTIMEDIFF Calculate the time difference of the splited samples.

splitNo = 1;
for i = 1 : 387
    load(['train' int2str(i) 's.mat']);
    for j = 1 : length(splitRecord)
        timeDiff{splitNo} = diff(splitRecord{j}(:,1));
        splitNo = splitNo + 1;
    end
end

timeDiff = cell2mat(timeDiff(:));

save('timeDiffall.mat', 'timeDiff');


%std(cell2mat(timeDiff(:)))
%mean(cell2mat(timeDiff(:)))

end