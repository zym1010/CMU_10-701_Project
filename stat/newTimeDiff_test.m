function newTimeDiff_test()
%NEWTIMEDIFF Calculate the time difference of the splited samples.

splitNo = 1;
for i = 1 : 90024
    load(['test' int2str(i) 's.mat']);
    for j = 1 : length(splitRecord)
        timeDiff{splitNo} = diff(splitRecord{j}(:,1));
        splitNo = splitNo + 1;
    end
end

timeDiff = cell2mat(timeDiff(:));

save('timeDiffall_test.mat', 'timeDiff');


%std(cell2mat(timeDiff(:)))
%mean(cell2mat(timeDiff(:)))

end