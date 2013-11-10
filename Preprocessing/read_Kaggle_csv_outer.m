function [count_map] =  read_Kaggle_csv_outer(filename,prefix)
% READ_KAGGLE_CSV_OUTER ... 
%  
%   ... 
% 
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    input1 - Description
%    input2 - Description
%    input3 - Description
%
% Outputs:
%    output1 - Description
%    output2 - Description
%
% Example: 
%    Line 1 of example
%    Line 2 of example
%    Line 3 of example
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
%

%% AUTHOR    : Yimeng Zhang
%% Computer Science Department, Carnegie Mellon University
%% EMAIL     : zym1010@gmail.com 

%% $DATE     : 07-Nov-2013 11:43:34 $ 
%% $Revision : 1.00 $ 
%% DEVELOPED : 8.1.0.604 (R2013a) 
%% FILENAME  : read_Kaggle_csv_outer.m 

%% MODIFICATIONS:
%% $26-Sep-2002 14:44:35 $
%% blablabla
%% ---
%% $25-Feb-2002 07:29:17 $ 
%% blablabla

count_map = containers.Map('KeyType','uint32','ValueType','any');

fid = fopen(filename);

fgetl(fid); % read off the header

i = 0;

[recording, ~, current_line_raw, device_ID, eof] = read_Kaggle_csv(fid);

while ~eof
    i = i + 1;
    save([prefix int2str(i) '.mat'], 'recording', 'device_ID');
    if ~isKey(count_map,device_ID)
        count_map(device_ID) = i;
    else
        count_map(device_ID) = [count_map(device_ID), i];
    end
    [recording, ~, current_line_raw, device_ID, eof] = read_Kaggle_csv(fid, current_line_raw);
end


i = i + 1;
save([prefix int2str(i) '.mat'], 'recording', 'device_ID');
if ~isKey(count_map,device_ID)
    count_map(device_ID) = i;
else
    count_map(device_ID) = [count_map(device_ID), i];
end


fclose(fid);

end






% Created with NEWFCN.m by Frank González-Morphy 
% Contact...: frank.gonzalez-morphy@mathworks.de  
% ===== EOF ====== [read_Kaggle_csv_outer.m] ======  
