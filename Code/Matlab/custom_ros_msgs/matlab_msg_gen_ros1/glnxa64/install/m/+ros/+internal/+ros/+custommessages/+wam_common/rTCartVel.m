function [data, info] = rTCartVel
%RTCartVel gives an empty data for wam_common/RTCartVel
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/RTCartVel';
[data.Direction, info.Direction] = ros.internal.ros.messages.ros.default_type('single',3);
[data.Magnitude, info.Magnitude] = ros.internal.ros.messages.ros.default_type('single',1);
info.MessageType = 'wam_common/RTCartVel';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,2);
info.MatPath{1} = 'direction';
info.MatPath{2} = 'magnitude';
