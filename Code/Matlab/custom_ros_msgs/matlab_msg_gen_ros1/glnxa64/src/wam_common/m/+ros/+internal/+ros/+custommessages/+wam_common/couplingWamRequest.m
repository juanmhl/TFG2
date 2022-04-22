function [data, info] = couplingWamRequest
%CouplingWam gives an empty data for wam_common/CouplingWamRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/CouplingWamRequest';
[data.CouplingCamera, info.CouplingCamera] = ros.internal.ros.messages.ros.default_type('logical',1);
[data.CouplingIlumination, info.CouplingIlumination] = ros.internal.ros.messages.ros.default_type('logical',1);
info.MessageType = 'wam_common/CouplingWamRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,2);
info.MatPath{1} = 'couplingCamera';
info.MatPath{2} = 'couplingIlumination';
