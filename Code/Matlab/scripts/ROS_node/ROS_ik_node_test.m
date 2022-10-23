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

%% Prueba 1: movimiento a un pto sobre el eje z

jointmsg.Joints = [0 0 0 0 0 0 0];

T = [1 0 0 0;
     0 1 0 0;
     0 0 1 0.7;
     0 0 0 1];

phi = -pi;

send_iksolution_to(T,phi);

%% Prueba 2: movimiento en circunferencia alrededor del eje z
T = [1 0 0 0;
     0 1 0 0;
     0 0 1 0.7;
     0 0 0 1];
for phi = -0.75:-0.75:-6
    send_iksolution_to(T,wrapToPi(phi));
    pause(2);
end

%% Prueba 3: movimiento a posiciones límite de la cámara

camTtcp = [ -1 0  0 0;
             0 1  0 0;
             0 0 -1 0;
             0 0  0 1
          ];

baseTpivot = [ -1  0 0  0.583;
                0 -1 0  0;
                0  0 1 -0.118;
                0  0 0  1
             ];

alfa = [15 15 15 15 80 80 80 80];
rho = [0.14 0.14 0.22 0.22 0.14 0.14 0.22 0.22];
beta = [30 -30 30 -30 30 -30 30 -30];

% thDegSol = zeros([8,7]);

phi = -pi/2;

%%
for i = 1:8
    T = baseTpivot*PoseCamaraSimulador(rho(i),beta(i),alfa(i))*camTtcp;
%     [th, thDeg, A] = mci_wam(T,phi,'O',toolOffset,0,0);
%     plot3(T(1,4),T(2,4),T(3,4),'*');
%     hold on
%     thDegSol(i,:) = thDeg;
%     figure; show(wamTree,th);
    send_iksolution_to(T);
    pause(6);
end

%% Prueba 4: posicion especifica
baseTpivot = [ -1  0 0  0.587;
                0 -1 0  0;
                0  0 1 -0.118;
                0  0 0  1
             ];

T = baseTpivot*PoseCamaraSimulador(0.2,-20,35)*camTtcp;
% T = baseTpivot*PoseCamaraSimulador(0.22,0,50)*camTtcp;
% T=baseTpivot*desp([0 0 -0.025])*camTtcp;
send_iksolution_to(T);


%% Prueba 4: Movimiento a punto que limite phi

T = [-1 0 0 0.6;
     0 1 0 -0.3;
     0 0 -1 -0.2;
     0 0 0 1];

phi = 0;

send_iksolution_to(T,phi);

%% Cierre ROS

rosshutdown;