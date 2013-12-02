function [ PSDentropy ] = computePSDEntropy( FFTraw )
%COMPUTEPSDENTROPY Summary of this function goes here
%   Detailed explanation goes here
assert(size(FFTraw,2)==3);

PSDraw = FFTraw.^2;

PSDraw(2:end-1,:) = 2*PSDraw(2:end-1,:);

PSDentropy = computePSDEntropy_inner(PSDraw);

end


function PSDentropy = computePSDEntropy_inner(PSDraw)

assert(size(PSDraw,2) == 3)

PSDentropy = zeros(3,1);

for i = 1:3
    PSDnormalized = PSDraw(:,i);
    PSDnormalized(PSDnormalized==0) = [];
    if ~isempty(PSDnormalized)
        PSDnormalized = PSDnormalized./sum(PSDnormalized);
        PSDentropy(i) = -sum(PSDnormalized.*log(PSDnormalized));
    else
        PSDentropy(i) = 0;
    end
end

end
