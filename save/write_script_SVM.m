function [  ] = write_script_SVM( suffixArray, scriptName )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

fid = fopen(scriptName,'w');


fprintf(fid,'export OMP_NUM_THREADS=20\n');

for i = 1:length(suffixArray)
    suffix = suffixArray{i};
    fprintf(fid, 'libsvm-3.17_mp/libsvm-3.17/svm-train -b 1 -g 10 -c 5 train_%s.data %s.svmmodel\n',suffix,suffix);
    fprintf(fid, 'libsvm-3.17_mp/libsvm-3.17/svm-predict -b 1 test_%s.data %s.svmmodel %s.svmoutput\n',suffix,suffix,suffix);
    fprintf(fid,'\n');
end

fclose(fid);

end

