function [  ] = write_script( suffixArray, scriptName )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

fid = fopen(scriptName,'w');

fprintf(fid,'export OMP_NUM_THREADS=20\n');

for i = 1:length(suffixArray)
    suffix = suffixArray{i};
    fprintf(fid, 'liblinear-1.94/train -s 0 -c 1 train_%s.data %s.model\n',suffix,suffix);
    fprintf(fid, 'liblinear-1.94/predict -b 1 test_%s.data %s.model %s.output\n',suffix,suffix,suffix);
    fprintf(fid,'\n');
end

fclose(fid);

end

