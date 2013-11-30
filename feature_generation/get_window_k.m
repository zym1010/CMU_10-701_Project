function [ range ] = get_window_k( record_length, window_length, window_shift, k )
%GET_WINDOW_K Summary of this function goes here
%   Detailed explanation goes here

assert(k>=1);

range = (k-1)*window_shift + 1:...
    min((k-1)*window_shift + window_length, record_length);


if k >= 2
    assert((k-2)*window_shift + window_length < record_length);
end
assert(~isempty(range));

end

