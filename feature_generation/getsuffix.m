function [ suffix ] = getsuffix( numbers )
%GETSUFFIX Summary of this function goes here
%   Detailed explanation goes here
suffix = '';

for i = 1:length(numbers)
    suffix = [suffix int2str(numbers(i))];
end

end

