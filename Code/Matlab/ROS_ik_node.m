%% Inicializacion
clear all

% Creacion del ROS Master
rosinit

% Modelo urdf del robot WAM (visualizacion)
% global wamTree;
% wamTree = importrobot("mirobot.urdf");

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
call(homeclient,homemsg);
jointmsg.Joints = [0 0 0 0 0 0 0];
call(jointclient,jointmsg);

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

T = robotTfulcro*PoseCamaraSimulador(0.2,-20,35)*camTtcp;
send_iksolution_to(T);

%% Cierre ROS

% rosshutdown;