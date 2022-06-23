function [data, info] = changeMinirobotRequest
%ChangeMinirobot gives an empty data for wam_common/ChangeMinirobotRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/ChangeMinirobotRequest';
[data.Minirobot, info.Minirobot] = ros.internal.ros.messages.ros.default_type('single',1);
info.MessageType = 'wam_common/ChangeMinirobotRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'minirobot';
