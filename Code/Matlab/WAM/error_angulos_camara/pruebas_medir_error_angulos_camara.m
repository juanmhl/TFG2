%% Inicializacion de parametros
clear all

robotTfulcro = [ -1  0 0  0.587;
                  0 -1 0  0;
                  0  0 1 -0.118;
                  0  0 0  1
               ];

camTtcp = [ -1 0  0 0;
             0 1  0 0;
             0 0 -1 0;
             0 0  0 1
          ];

%% Inicializacion de ROS
% Creacion del ROS Master
rosinit

%% Creacion de clientes de servicios y suscriptores de topics
homeclient = rossvcclient("/wam/go_home");
global jointclient;
jointclient = rossvcclient("/wam/joint_move");
global posesub;
posesub = rossubscriber("/wam/pose");

%% Creacion de mensajes para los servicios
homemsg = rosmessage(homeclient);
global jointmsg;
jointmsg = rosmessage(jointclient);

jointmsg.Joints = [0 0 0 0 0 0 0];

%% COSAS
% robotTobjetivo = robotTfulcro*PoseCamaraSimulador(15,20,0.14)*camTtcp;

%% Prueba 3: posiciones límite de la cámara

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

alfa = [15 15 15 15 80 80 80 80];
rho = [0.14 0.14 0.22 0.22 0.14 0.14 0.22 0.22];
beta = [30 -30 30 -30 30 -30 30 -30];

% thDegSol = zeros([8,7]);

phi = -pi/2;

for i = 1:1
    robotTobjetivo = robotTfulcro*PoseCamaraSimulador(rho(i),beta(i),alfa(i))*camTtcp;
%     [th, thDeg, A] = mci_wam(T,phi,'O',toolOffset,0,0);
%     plot3(T(1,4),T(2,4),T(3,4),'*');
%     hold on
%     thDegSol(i,:) = thDeg;
%     figure; show(wamTree,th);
%     send_iksolution_to(T);
%     pause(6);
end


thRad = send_iksolution_to(robotTobjetivo);
robotTobjetivo_tras_mci = MCD_WAM(thRad);
pause(3)
robotTobjetivo_real = pose_wam();

T = inv(robotTfulcro)*robotTobjetivo_real*inv(camTtcp);

alpha_real = rad2deg(atan2(-T(2,3),T(3,3)))
beta_real = rad2deg(atan2(-T(1,2),T(1,1)))
rho = T(1,4)/T(1,2)


%% Cierre ROS

rosshutdown;

