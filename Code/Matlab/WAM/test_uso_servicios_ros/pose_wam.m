function [T,pos,quaternion] = pose_wam
    global posesub;
    posemsg = receive(posesub);

    pos = [posemsg.Pose.Position.X;
           posemsg.Pose.Position.Y;
           posemsg.Pose.Position.Z];
    
    quaternion = [posemsg.Pose.Orientation.W;
                  posemsg.Pose.Orientation.X;
                  posemsg.Pose.Orientation.Y;
                  posemsg.Pose.Orientation.Z]';
    
    R = quat2rotm(quaternion);
    
    T = [R pos; 0 0 0 1];
end