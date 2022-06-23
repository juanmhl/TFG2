function [data, info] = poseRequest
%Pose gives an empty data for wam_common/PoseRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'wam_common/PoseRequest';
info.MessageType = 'wam_common/PoseRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,0);
