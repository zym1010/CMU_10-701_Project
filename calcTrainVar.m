%global PROJECT_PARAMETER_STRUCT

var_list = [];

for i = 1:387
    load(['train' int2str(i) 'r' '.mat']);
    
    for j = 1:length(resampleRecord)
        record = resampleRecord{j};
        number_of_segment = floor(size(record,1)/16); % 16, 24, or 32 doesn't make much difference.
        
        for k = 1:number_of_segment
            segment = record(k*16-15:k*16,2:4);
            var_list(end+1) = sum(var(segment,0,1));
            
%             sum(var(segment,0,1))
%             if  sum(var(segment,0,1)) < 0.1
%                 
%                 subplot(3,1,1);
%                 plot(record(:,2));
%                 line([k*16-15, k*16-15], [min(record(:,2)), max(record(:,2))]);
%                 line([k*16, k*16], [min(record(:,2)), max(record(:,2))]);
%                 subplot(3,1,2);
%                 
%                 plot(record(:,3));
%                 line([k*16-15, k*16-15], [min(record(:,3)), max(record(:,3))]);
%                 line([k*16, k*16], [min(record(:,3)), max(record(:,3))]);
%                 subplot(3,1,3);
%                 plot(record(:,4));
%                 line([k*16-15, k*16-15], [min(record(:,4)), max(record(:,4))]);
%                 line([k*16, k*16], [min(record(:,4)), max(record(:,4))]);
%                 pause;
%             end
            
            %             if sum(var(segment,0,1)) > 800
            %                 keyboard;
            %             end
            %
            
        end
        
    end
    i
end

save('var_list_train_32.mat','var_list');
