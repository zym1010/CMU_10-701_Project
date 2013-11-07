function [current_recording, number_of_samples, current_line_raw, current_device_ID, eof] = read_Kaggle_csv(fid, next_line)
% READ_KAGGLE_CSV ...
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

%% $DATE     : 07-Nov-2013 10:01:25 $
%% $Revision : 1.00 $
%% DEVELOPED : 8.1.0.604 (R2013a)
%% FILENAME  : read_Kaggle_csv.m

%% MODIFICATIONS:
%% $26-Sep-2002 14:44:35 $
%% blablabla
%% ---
%% $25-Feb-2002 07:29:17 $
%% blablabla

eof = false;

if nargin < 2
    current_line_raw = fgetl(fid);
else
    current_line_raw = next_line;
end    


current_line_numerical = textscan(current_line_raw,'%u64 %f %f %f %u','Delimiter',',');
current_device_ID = current_line_numerical{5};
start_timestamp = current_line_numerical{1};

next_device_ID = current_device_ID;

current_recording = zeros(1,4);

number_of_samples = 0;

while next_device_ID == current_device_ID % add a new sample into current_recording
    number_of_samples = number_of_samples+1;
    disp(number_of_samples);
    
    assert(double(current_line_numerical{1} - start_timestamp)==current_line_numerical{1} - start_timestamp);
    current_recording(number_of_samples,1) = current_line_numerical{1} - start_timestamp;
    
    
    current_recording(number_of_samples,2) = current_line_numerical{2};
    current_recording(number_of_samples,3) = current_line_numerical{3};
    current_recording(number_of_samples,4) = current_line_numerical{4};
    if ~feof(fid)
        current_line_raw = fgetl(fid);
        current_line_numerical = textscan(current_line_raw,'%u64 %f %f %f %u','Delimiter',',');
        next_device_ID = current_line_numerical{5};
    else
        eof = true;
        return;
    end
end

end








% Created with NEWFCN.m by Frank González-Morphy
% Contact...: frank.gonzalez-morphy@mathworks.de
% ===== EOF ====== [read_Kaggle_csv.m] ======
