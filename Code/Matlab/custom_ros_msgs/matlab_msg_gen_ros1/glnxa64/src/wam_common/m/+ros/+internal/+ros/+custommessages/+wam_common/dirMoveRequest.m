function [data, info] = dirMoveRequest
%DirMove gives an empty data for wam_common/DirMoveRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/DirMoveRequest';
[data.Direc, info.Direc] = ros.internal.ros.messages.ros.char('string',0);
info.MessageType = 'wam_common/DirMoveRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'direc';
