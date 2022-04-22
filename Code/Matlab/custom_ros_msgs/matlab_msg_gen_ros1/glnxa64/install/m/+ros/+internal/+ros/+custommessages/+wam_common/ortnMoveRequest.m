function [data, info] = ortnMoveRequest
%OrtnMove gives an empty data for wam_common/OrtnMoveRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/OrtnMoveRequest';
[data.Orientation, info.Orientation] = ros.internal.ros.messages.ros.default_type('single',4);
info.MessageType = 'wam_common/OrtnMoveRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'orientation';
