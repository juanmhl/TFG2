%  function [T,pos,quaternion] = pose_wam
%     global posesub;
%     posemsg = receive(posesub);
% 
%     pos = [posemsg.Pose.Position.X;
%            posemsg.Pose.Position.Y;
%            posemsg.Pose.Position.Z];
%     
%     quaternion = [posemsg.Pose.Orientation.W;
%                   posemsg.Pose.Orientation.X;
%                   posemsg.Pose.Orientation.Y;
%                   posemsg.Pose.Orientation.Z]';
%     
%     R = quat2rotm(quaternion);
%     
%     T = [R pos; 0 0 0 1];


% 28 Sep 2022
% La lectura del topic de pose resultaba en una matriz T con un gran error
% de posición y orientación. Se ha corregido realizando la lectura del
% topic de posiciones articulares y aplicando el modelo cinemático directo.

function [T,thRad] = pose_wam

global jointsub;
jointstate = receive(jointsub);

thRad = jointstate.Position;
T = MCD_WAM(jointstate.Position);

end