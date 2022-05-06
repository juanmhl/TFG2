%% Apertura ROS Master
clear all
% rosshutdown
rosinit
global wamTree;
wamTree = importrobot("mirobot.urdf");

%% Creacion del nodo
% node = ros.Node('/WAMremote');

%% Creación de clientes de servicios
homeclient = rossvcclient("/wam/go_home");
global jointclient;
jointclient = rossvcclient("/wam/joint_move");

%% Creación de mensajes para los servicios
homemsg = rosmessage(homeclient);
global jointmsg;
jointmsg = rosmessage(jointclient);

% jointmsg.Joints = [-0.8 0.9 0 0.3 0 0.1 0];
jointmsg.Joints = [0 0 0 0 0 0 0];

%% LLamada a servicios
call(homeclient,homemsg);
jointmsg.Joints = [0 0 0 0 0 0 0];
call(jointclient,jointmsg);

%% Prueba 1: en el eje z 

jointmsg.Joints = [0 0 0 0 0 0 0];

T = [1 0 0 0;
     0 1 0 0;
     0 0 1 0.7;
     0 0 0 1];

phi = -pi;

send_iksolution_to(T,phi);

%% 
% 
% r = rosrate(200);
% 
% reset(r);
% 
% while (r.TotalElapsedTime < 10)
%     send_iksolution_to(T,phi);
% end

send_iksolution_to(T,phi);

%% Prueba 2: circunferencia alrededor del eje
T = [1 0 0 0;
     0 1 0 0;
     0 0 1 0.7;
     0 0 0 1];
for phi = -0.75:-0.75:-6
    send_iksolution_to(T,wrapToPi(phi));
%     pause(5);
end

%% Prueba 3: posiciones límite de la cámara

camTtcp = [ -1 0  0 0;
             0 1  0 0;
             0 0 -1 0;
             0 0  0 1
          ];

baseTpivot = [ -1  0 0  0.55;
                0 -1 0  0;
                0  0 1 -0.1;
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
    send_iksolution_to(T,phi);
    pause(6);
end

%% Prueba 4: Punto que limite phi

T = [-1 0 0 0.6;
     0 1 0 -0.3;
     0 0 -1 -0.2;
     0 0 0 1];

phi = 0;

send_iksolution_to(T,phi);

%% Cierre ROS

rosshutdown;

%% Funciones

function send_iksolution_to(T,phi)

    global jointclient;
    global jointmsg;
%     global wamTree;

    [thRad, phiOut] = mci_wam(T,phi,0,'O',0,0,0,0)

%     figure; show(wamTree,th);

    jointmsg.Joints = thRad;

    call(jointclient,jointmsg);

end