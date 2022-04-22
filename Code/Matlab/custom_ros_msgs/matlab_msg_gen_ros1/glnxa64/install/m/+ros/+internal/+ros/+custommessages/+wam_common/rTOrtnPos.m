function [data, info] = rTOrtnPos
%RTOrtnPos gives an empty data for wam_common/RTOrtnPos
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/RTOrtnPos';
[data.Orientation, info.Orientation] = ros.internal.ros.messages.ros.default_type('single',4);
[data.RateLimits, info.RateLimits] = ros.internal.ros.messages.ros.default_type('single',4);
info.MessageType = 'wam_common/RTOrtnPos';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,2);
info.MatPath{1} = 'orientation';
info.MatPath{2} = 'rate_limits';
