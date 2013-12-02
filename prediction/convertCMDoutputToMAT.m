function [ prob_estimates_all ] = convertCMDoutputToMAT( filename )
%CONVERTCMDOUTPUTTOMAT Summary of this function goes here
%   Detailed explanation goes here

fid = fopen(filename);

line1 = fgetl(fid);

labels = num2str(line1(7:end));

assert(isequal(str2num(labels),1:387));

prob_estimates_all = zeros(426625,387);


for i = 1:426625
    line =  fgetl(fid);
    numline = str2num(line);
    assert(length(numline)==388);
    %abs(sum(numline(2:388))-1)<(10e-5)
    assert(abs(sum(numline(2:388))-1)<(10e-5));
    prob_estimates_all(i,:) = numline(2:388);
    
    disp(i);
end

assert(feof(fid)==1);

fclose(fid);

% save('SVMresult_all.mat','prob_estimates_all');


end

