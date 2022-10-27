
classdef BHandFingerPosRequest < ros.Message
    %BHandFingerPosRequest MATLAB implementation of wam_common/BHandFingerPosRequest
    %   This class was automatically generated by
    %   ros.internal.pubsubEmitter.
    %   Copyright 2014-2020 The MathWorks, Inc.
    properties (Constant)
        MessageType = 'wam_common/BHandFingerPosRequest' % The ROS message type
    end
    properties (Constant, Hidden)
        MD5Checksum = 'b8c122f38450d0302ba1a30c9c588995' % The MD5 Checksum of the message definition
        PropertyList = { 'Radians' } % List of non-constant message properties
        ROSPropertyList = { 'radians' } % List of non-constant ROS message properties
        PropertyMessageTypes = { '' ...
            } % Types of contained nested messages
    end
    properties (Constant)
    end
    properties
        Radians
    end
    methods
        function set.Radians(obj, val)
            validClasses = {'numeric'};
            val = val(:);
            validAttributes = {'vector', 'numel', 3};
            validateattributes(val, validClasses, validAttributes, 'BHandFingerPosRequest', 'Radians');
            obj.Radians = single(val);
        end
    end
    methods (Static, Access = {?matlab.unittest.TestCase, ?ros.Message})
        function obj = loadobj(strObj)
        %loadobj Implements loading of message from MAT file
        % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = ros.msggen.wam_common.BHandFingerPosRequest.empty(0,1);
                return
            end
            % Create an empty message object
            obj = ros.msggen.wam_common.BHandFingerPosRequest(strObj);
        end
    end
end