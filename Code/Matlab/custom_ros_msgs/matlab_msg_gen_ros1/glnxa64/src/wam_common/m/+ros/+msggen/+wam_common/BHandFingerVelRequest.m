
classdef BHandFingerVelRequest < ros.Message
    %BHandFingerVelRequest MATLAB implementation of wam_common/BHandFingerVelRequest
    %   This class was automatically generated by
    %   ros.internal.pubsubEmitter.
    %   Copyright 2014-2020 The MathWorks, Inc.
    properties (Constant)
        MessageType = 'wam_common/BHandFingerVelRequest' % The ROS message type
    end
    properties (Constant, Hidden)
        MD5Checksum = 'd4b1534f81253843d8e7435f97fbf189' % The MD5 Checksum of the message definition
        PropertyList = { 'Velocity' } % List of non-constant message properties
        ROSPropertyList = { 'velocity' } % List of non-constant ROS message properties
        PropertyMessageTypes = { '' ...
            } % Types of contained nested messages
    end
    properties (Constant)
    end
    properties
        Velocity
    end
    methods
        function set.Velocity(obj, val)
            validClasses = {'numeric'};
            val = val(:);
            validAttributes = {'vector', 'numel', 3};
            validateattributes(val, validClasses, validAttributes, 'BHandFingerVelRequest', 'Velocity');
            obj.Velocity = single(val);
        end
    end
    methods (Static, Access = {?matlab.unittest.TestCase, ?ros.Message})
        function obj = loadobj(strObj)
        %loadobj Implements loading of message from MAT file
        % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = ros.msggen.wam_common.BHandFingerVelRequest.empty(0,1);
                return
            end
            % Create an empty message object
            obj = ros.msggen.wam_common.BHandFingerVelRequest(strObj);
        end
    end
end
