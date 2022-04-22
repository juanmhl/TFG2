
classdef RTJointTrq < ros.Message
    %RTJointTrq MATLAB implementation of wam_common/RTJointTrq
    %   This class was automatically generated by
    %   ros.internal.pubsubEmitter.
    %   Copyright 2014-2020 The MathWorks, Inc.
    properties (Constant)
        MessageType = 'wam_common/RTJointTrq' % The ROS message type
    end
    properties (Constant, Hidden)
        MD5Checksum = 'eee8a087b75bc454bfb2231a0ca7e0f2' % The MD5 Checksum of the message definition
        PropertyList = { 'Torques' } % List of non-constant message properties
        ROSPropertyList = { 'torques' } % List of non-constant ROS message properties
        PropertyMessageTypes = { '' ...
            } % Types of contained nested messages
    end
    properties (Constant)
    end
    properties
        Torques
    end
    methods
        function set.Torques(obj, val)
            validClasses = {'numeric'};
            if isempty(val)
                % Allow empty [] input
                val = single.empty(0, 1);
            end
            val = val(:);
            validAttributes = {'vector'};
            validateattributes(val, validClasses, validAttributes, 'RTJointTrq', 'Torques');
            obj.Torques = single(val);
        end
    end
    methods (Static, Access = {?matlab.unittest.TestCase, ?ros.Message})
        function obj = loadobj(strObj)
        %loadobj Implements loading of message from MAT file
        % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = ros.msggen.wam_common.RTJointTrq.empty(0,1);
                return
            end
            % Create an empty message object
            obj = ros.msggen.wam_common.RTJointTrq(strObj);
        end
    end
end
