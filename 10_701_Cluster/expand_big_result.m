load('alleged_device_ID_list.mat');
load('aggregate_smooth_result.mat');


new_big_result = {};


for i = 1:10780
    sublist = alleged_device_ID_list(big_result{i});
    unique_groups = unique(sublist);
    
    
    
    for j = 1:length(unique_groups)
        new_big_result{end+1} =  big_result{i}(sublist==unique_groups(j));
    end
    
end