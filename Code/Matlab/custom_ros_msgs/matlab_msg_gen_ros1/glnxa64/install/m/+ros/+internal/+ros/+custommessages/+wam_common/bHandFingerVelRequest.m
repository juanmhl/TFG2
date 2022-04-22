function [data, info] = bHandFingerVelRequest
%BHandFingerVel gives an empty data for wam_common/BHandFingerVelRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/BHandFingerVelRequest';
[data.Velocity, info.Velocity] = ros.internal.ros.messages.ros.default_type('single',3);
info.MessageType = 'wam_common/BHandFingerVelRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'velocity';
