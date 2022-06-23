function [data, info] = poseMoveRequest
%PoseMove gives an empty data for wam_common/PoseMoveRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/PoseMoveRequest';
[data.Pose, info.Pose] = ros.internal.ros.messages.geometry_msgs.pose;
info.Pose.MLdataType = 'struct';
info.MessageType = 'wam_common/PoseMoveRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,10);
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
