function [data, info] = holdResponse
%Hold gives an empty data for wam_common/HoldResponse
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/HoldResponse';
info.MessageType = 'wam_common/HoldResponse';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,0);
