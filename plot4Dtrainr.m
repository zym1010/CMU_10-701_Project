function plot4Dtrainr()


for j = 1:387
    
    load(['train' int2str(j) 'r.mat'])
    
    for i = 1:length(resampleRecord)
        
        if resampleRecord{i}(end,1) > 100000

            
        subplot(3,1,1);
        plot(resampleRecord{i}(:,2));
        subplot(3,1,2);
        plot(resampleRecord{i}(:,3));
        subplot(3,1,3);
        plot(resampleRecord{i}(:,4));
        
        title([num2str(j) ' ' num2str(i)]);
        
        pause
        
       
        
        end
    end
end