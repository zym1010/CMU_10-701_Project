function [  ] = init_cluster_parameter(  )
%INIT_CLUSTER_PARAMETER Summary of this function goes here
%   Detailed explanation goes here
global CLUSTER_PARAM

CLUSTER_PARAM.max_time_gap = 500;
CLUSTER_PARAM.max_readout_diff = 1;

end

