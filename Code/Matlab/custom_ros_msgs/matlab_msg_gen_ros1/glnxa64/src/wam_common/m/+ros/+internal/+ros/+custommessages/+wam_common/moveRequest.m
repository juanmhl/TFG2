function [data, info] = moveRequest
%Move gives an empty data for wam_common/MoveRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/MoveRequest';
[data.Position, info.Position] = ros.internal.ros.messages.geometry_msgs.point;
info.Position.MLdataType = 'struct';
[data.Orientation, info.Orientation] = ros.internal.ros.messages.std_msgs.float32MultiArray;
info.Orientation.MLdataType = 'struct';
info.MessageType = 'wam_common/MoveRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,12);
info.MatPath{1} = 'position';
info.MatPath{2} = 'position.x';
info.MatPath{3} = 'position.y';
info.MatPath{4} = 'position.z';
info.MatPath{5} = 'orientation';
info.MatPath{6} = 'orientation.layout';
info.MatPath{7} = 'orientation.layout.dim';
info.MatPath{8} = 'orientation.layout.dim.label';
info.MatPath{9} = 'orientation.layout.dim.size';
info.MatPath{10} = 'orientation.layout.dim.stride';
info.MatPath{11} = 'orientation.layout.data_offset';
info.MatPath{12} = 'orientation.data';
