function [data, info] = rTCartPos
%RTCartPos gives an empty data for wam_common/RTCartPos
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/RTCartPos';
[data.Position, info.Position] = ros.internal.ros.messages.ros.default_type('single',3);
[data.RateLimits, info.RateLimits] = ros.internal.ros.messages.ros.default_type('single',3);
info.MessageType = 'wam_common/RTCartPos';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,2);
info.MatPath{1} = 'position';
info.MatPath{2} = 'rate_limits';
