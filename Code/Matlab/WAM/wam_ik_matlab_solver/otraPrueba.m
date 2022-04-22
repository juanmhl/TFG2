wamTree = importrobot("barrett_model\robots\mirobot.urdf");

%%

T = [1 0 0.4959 0.1;
     0 1 0.6393 0.1;
     0 0 -0.5877 0.6;
     0 0 0 1];

phi = pi/6;

% th(1).JointName = 'wam/base_yaw_joint';
% th(2).JointName = 'wam/shoulder_pitch_joint';
% th(3).JointName = 'wam/shoulder_yaw_joint';
% th(4).JointName = 'wam/elbow_pitch_joint';
% th(5).JointName = 'wam/wrist_yaw_joint';
% th(6).JointName = 'wam/wrist_pitch_joint';
% th(7).JointName = 'wam/palm_yaw_joint';
% 
% th(1).JointPosition = 0;
% th(2).JointPosition = 0;
% th(3).JointPosition = 0;
% th(4).JointPosition = pi/2;
% th(5).JointPosition = 0;
% th(6).JointPosition = 0;
% th(7).JointPosition = 0;

jointConfig = wam_ik(T,phi,'out')

figure; show(wamTree,jointConfig);