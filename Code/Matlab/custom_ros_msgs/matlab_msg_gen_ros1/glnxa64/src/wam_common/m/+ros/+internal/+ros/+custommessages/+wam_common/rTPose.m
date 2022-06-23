function [data, info] = rTPose
%RTPose gives an empty data for wam_common/RTPose
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/RTPose';
[data.Position, info.Position] = ros.internal.ros.messages.ros.default_type('single',3);
[data.Orientation, info.Orientation] = ros.internal.ros.messages.ros.default_type('single',4);
[data.PosRateLimits, info.PosRateLimits] = ros.internal.ros.messages.ros.default_type('single',3);
[data.OrtnRateLimits, info.OrtnRateLimits] = ros.internal.ros.messages.ros.default_type('single',4);
info.MessageType = 'wam_common/RTPose';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,4);
info.MatPath{1} = 'position';
info.MatPath{2} = 'orientation';
info.MatPath{3} = 'pos_rate_limits';
info.MatPath{4} = 'ortn_rate_limits';
