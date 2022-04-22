function [data, info] = poseResponse
%Pose gives an empty data for wam_common/PoseResponse
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/PoseResponse';
[data.Pose, info.Pose] = ros.internal.ros.messages.geometry_msgs.pose;
info.Pose.MLdataType = 'struct';
[data.OrientMatrix, info.OrientMatrix] = ros.internal.ros.messages.std_msgs.float32MultiArray;
info.OrientMatrix.MLdataType = 'struct';
info.MessageType = 'wam_common/PoseResponse';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,18);
info.MatPath{1} = 'pose';
info.MatPath{2} = 'pose.position';
info.MatPath{3} = 'pose.position.x';
info.MatPath{4} = 'pose.position.y';
info.MatPath{5} = 'pose.position.z';
info.MatPath{6} = 'pose.orientation';
info.MatPath{7} = 'pose.orientation.x';
info.MatPath{8} = 'pose.orientation.y';
info.MatPath{9} = 'pose.orientation.z';
info.MatPath{10} = 'pose.orientation.w';
info.MatPath{11} = 'orientMatrix';
info.MatPath{12} = 'orientMatrix.layout';
info.MatPath{13} = 'orientMatrix.layout.dim';
info.MatPath{14} = 'orientMatrix.layout.dim.label';
info.MatPath{15} = 'orientMatrix.layout.dim.size';
info.MatPath{16} = 'orientMatrix.layout.dim.stride';
info.MatPath{17} = 'orientMatrix.layout.data_offset';
info.MatPath{18} = 'orientMatrix.data';
