% Si se mantienen comentadas las lineas que estan comentadas, se puede
% ejecutar este script para inicializar las variables necesarias del
% framework. El flujo sería el siguiente:
% rosinit
% en el otro pc, inicializar nodo del robot
% ROS_ik_node
% T = ...
% send_iksolution_to(T)

% %% Inicializacion
% clear all
% 
% % Creacion del ROS Master
% rosinit

% Modelo urdf del robot WAM (visualizacion y mci numerico)
global wamTree;
wamTree = importrobot("mirobot.urdf");
global ik;
ik = inverseKinematics('RigidBodyTree',wamTree);
th(1).JointName = 'wam/base_yaw_joint';
th(2).JointName = 'wam/shoulder_pitch_joint';
th(3).JointName = 'wam/shoulder_yaw_joint';
th(4).JointName = 'wam/elbow_pitch_joint';
th(5).JointName = 'wam/wrist_yaw_joint';
th(6).JointName = 'wam/wrist_pitch_joint';
th(7).JointName = 'wam/palm_yaw_joint';
th(1).JointPosition = 0;
th(2).JointPosition = 0;
th(3).JointPosition = 0;
th(4).JointPosition = 0;
th(5).JointPosition = 0;
th(6).JointPosition = 0;
th(7).JointPosition = 0;
transform = getTransform(wamTree,th,'wam/shoulder_yaw_link');
global altura;
altura = transform(3,4);

global gik;
gik = generalizedInverseKinematics('RigidBodyTree', wamTree, ...
    'ConstraintInputs', {'pose','joint'})

efectorFinal = 'wam/wrist_palm_stump_link';
global restriccionPose;
restriccionPose = constraintPoseTarget(efectorFinal);

global limitJointChange;
limitJointChange = constraintJointBounds(wamTree);

%% Creacion de clientes de servicios y suscriptores de topics
homeclient = rossvcclient("/wam/go_home");
global jointclient;
jointclient = rossvcclient("/wam/joint_move");
global posesub;
posesub = rossubscriber("/wam/pose");
global jointsub;
jointsub = rossubscriber("/wam/joint_states");
%% Creacion de mensajes para los servicios
homemsg = rosmessage(homeclient);
global jointmsg;
jointmsg = rosmessage(jointclient);
jointmsg.Joints = [0 0 0 0 0 0 0];

%% LLamada a servicios
call(homeclient,homemsg);   % Enviar robot a posicion de reposo doblado
% 
jointmsg.Joints = [0 0 0 0 0 0 0];
call(jointclient,jointmsg); % Enviar robot a pose con todo extendido

%% Movimiento a una posicion especifica
camTtcp = [ -1 0  0 0;
             0 1  0 0;
             0 0 -1 0;
             0 0  0 1
          ];

robotTfulcro = [ -1  0 0  0.583;
                0 -1 0  0;
                0  0 1 -0.118;
                0  0 0  1
             ];
%%
T = robotTfulcro*PoseCamaraSimulador(0.18,0,20)*camTtcp;
send_iksolution_to(T);

%% Cierre ROS

% rosshutdown;