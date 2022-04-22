function [data, info] = rTJointVel
%RTJointVel gives an empty data for wam_common/RTJointVel
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/RTJointVel';
[data.Velocities, info.Velocities] = ros.internal.ros.messages.ros.default_type('single',NaN);
info.MessageType = 'wam_common/RTJointVel';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'velocities';
