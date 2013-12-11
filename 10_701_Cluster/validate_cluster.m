function [  ] = validate_cluster( cluster )
%VALIDATE_PROPOSED_CLUSTER Summary of this function goes here
%   Detailed explanation goes here

load('start_end_test_double_initial.mat');

for i = 1:length(cluster.seg_cell)
    assert(has_no_overlap_big(start_end_d(cluster.seg_cell{i},:)));
    i
end
    
    

end

