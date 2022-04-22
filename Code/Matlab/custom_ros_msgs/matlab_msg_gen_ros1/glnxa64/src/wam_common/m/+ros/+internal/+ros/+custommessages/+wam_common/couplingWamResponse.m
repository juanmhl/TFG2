function [data, info] = couplingWamResponse
%CouplingWam gives an empty data for wam_common/CouplingWamResponse
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/CouplingWamResponse';
info.MessageType = 'wam_common/CouplingWamResponse';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,0);
