function [data, info] = moveResponse
%Move gives an empty data for wam_common/MoveResponse
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/MoveResponse';
info.MessageType = 'wam_common/MoveResponse';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,0);
