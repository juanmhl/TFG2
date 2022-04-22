function [data, info] = holdRequest
%Hold gives an empty data for wam_common/HoldRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/HoldRequest';
[data.Hold, info.Hold] = ros.internal.ros.messages.ros.default_type('logical',1);
info.MessageType = 'wam_common/HoldRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'hold';
