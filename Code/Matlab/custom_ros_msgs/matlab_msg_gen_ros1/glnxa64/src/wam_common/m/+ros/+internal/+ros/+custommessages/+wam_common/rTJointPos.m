function [data, info] = rTJointPos
%RTJointPos gives an empty data for wam_common/RTJointPos
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/RTJointPos';
[data.Joints, info.Joints] = ros.internal.ros.messages.ros.default_type('single',NaN);
[data.RateLimits, info.RateLimits] = ros.internal.ros.messages.ros.default_type('single',NaN);
info.MessageType = 'wam_common/RTJointPos';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,2);
info.MatPath{1} = 'joints';
info.MatPath{2} = 'rate_limits';
