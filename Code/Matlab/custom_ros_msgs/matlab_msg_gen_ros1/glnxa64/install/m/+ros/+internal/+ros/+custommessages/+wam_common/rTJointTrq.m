function [data, info] = rTJointTrq
%RTJointTrq gives an empty data for wam_common/RTJointTrq
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/RTJointTrq';
[data.Torques, info.Torques] = ros.internal.ros.messages.ros.default_type('single',NaN);
info.MessageType = 'wam_common/RTJointTrq';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'torques';
