function [data, info] = gravityCompRequest
%GravityComp gives an empty data for wam_common/GravityCompRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/GravityCompRequest';
[data.Gravity, info.Gravity] = ros.internal.ros.messages.ros.default_type('logical',1);
info.MessageType = 'wam_common/GravityCompRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'gravity';
