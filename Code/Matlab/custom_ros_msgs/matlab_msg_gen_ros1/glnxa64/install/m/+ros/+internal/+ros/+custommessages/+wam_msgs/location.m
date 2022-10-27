function [data, info] = location
%Location gives an empty data for wam_msgs/Location
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_msgs/Location';
[data.Header, info.Header] = ros.internal.ros.messages.std_msgs.header;
info.Header.MLdataType = 'struct';
[data.Columna1Orientation, info.Columna1Orientation] = ros.internal.ros.messages.geometry_msgs.point;
info.Columna1Orientation.MLdataType = 'struct';
[data.Columna2Orientation, info.Columna2Orientation] = ros.internal.ros.messages.geometry_msgs.point;
info.Columna2Orientation.MLdataType = 'struct';
[data.Columna3Orientation, info.Columna3Orientation] = ros.internal.ros.messages.geometry_msgs.point;
info.Columna3Orientation.MLdataType = 'struct';
[data.Columna4Position, info.Columna4Position] = ros.internal.ros.messages.geometry_msgs.point;
info.Columna4Position.MLdataType = 'struct';
info.MessageType = 'wam_msgs/Location';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,22);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.seq';
info.MatPath{3} = 'header.stamp';
info.MatPath{4} = 'header.stamp.sec';
info.MatPath{5} = 'header.stamp.nsec';
info.MatPath{6} = 'header.frame_id';
info.MatPath{7} = 'columna1_orientation';
info.MatPath{8} = 'columna1_orientation.x';
info.MatPath{9} = 'columna1_orientation.y';
info.MatPath{10} = 'columna1_orientation.z';
info.MatPath{11} = 'columna2_orientation';
info.MatPath{12} = 'columna2_orientation.x';
info.MatPath{13} = 'columna2_orientation.y';
info.MatPath{14} = 'columna2_orientation.z';
info.MatPath{15} = 'columna3_orientation';
info.MatPath{16} = 'columna3_orientation.x';
info.MatPath{17} = 'columna3_orientation.y';
info.MatPath{18} = 'columna3_orientation.z';
info.MatPath{19} = 'columna4_position';
info.MatPath{20} = 'columna4_position.x';
info.MatPath{21} = 'columna4_position.y';
info.MatPath{22} = 'columna4_position.z';