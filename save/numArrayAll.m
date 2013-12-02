numberArray = cell(16,1);

for i = 1:16
    binRep = dec2bin(i-1,4);
    
    numberArray{i} = [1 1 1 str2num(binRep(1)) 0 0 0 str2num(binRep(2))...
        str2num(binRep(3)) str2num(binRep(4))];
end