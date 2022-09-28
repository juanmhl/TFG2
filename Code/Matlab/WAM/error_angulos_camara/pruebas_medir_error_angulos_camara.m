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
global jointsub;
jointsub = rossubscriber("/wam/joint_states");

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

%%
robotTobjetivo = robotTfulcro*PoseCamaraSimulador(0.15, ...  % rho, metros, cuanto sale
                                                    0, ...  % beta, horizontal, grados
                                                    20 ...  % alpha, vertical, grados
                                                 )*camTtcp;

thRad = send_iksolution_to(robotTobjetivo);
robotTobjetivo_tras_mci = MCD_WAM(thRad);
pause(4)
robotTobjetivo_real = pose_wam();

T = inv(robotTfulcro)*robotTobjetivo_real*inv(camTtcp)*rotZ(pi/2);

alpha_real = rad2deg(atan2(-T(2,3),T(3,3)))
beta_real = rad2deg(atan2(-T(1,2),T(1,1)))
% rho = T(1,4)/T(1,2)
rho_real = sqrt( (T(2,4)/T(3,3))^2 + T(1,4)^2 )

%% Bateria de tests:

tests = [];
k = 1;

robotTobjetivo = robotTfulcro*PoseCamaraSimulador(0.14,-30,15)*camTtcp;
send_iksolution_to(robotTobjetivo);
pause(30)

for alpha = 15:5:80
    for beta = -30:5:30
        for rho = 0.14:0.02:0.22
            robotTobjetivo = robotTfulcro*PoseCamaraSimulador(rho,beta,alpha)*camTtcp;
            thRad = send_iksolution_to(robotTobjetivo);
            robotTobjetivo_tras_mci = MCD_WAM(thRad);

            pause(5)
            
            [robotTobjetivo_real, thRad_real] = pose_wam();
            T = inv(robotTfulcro)*robotTobjetivo_real*inv(camTtcp)*rotZ(pi/2);
            alpha_real = rad2deg(atan2(-T(2,3),T(3,3)));
            beta_real = rad2deg(atan2(-T(1,2),T(1,1)));
            rho_real = sqrt( (T(2,4)/T(3,3))^2 + T(1,4)^2 );

            tests(k).alpha = alpha;
            tests(k).alpha_real = alpha_real;
            tests(k).beta = beta;
            tests(k).beta_real = beta_real;
            tests(k).rho = rho;
            tests(k).rho_real = rho_real
            tests(k).T_deseada = robotTobjetivo;
            tests(k).T_tras_mci = robotTobjetivo_tras_mci;
            tests(k).T_real = T;
            tests(k).thRad_deseada = thRad;
            tests(k).thRad_real = thRad_real;

            k = k+1;

        end

        pause(10)

    end

    pause(10)

end

save("tests_precision.mat","tests")




%% Cierre ROS

rosshutdown;

