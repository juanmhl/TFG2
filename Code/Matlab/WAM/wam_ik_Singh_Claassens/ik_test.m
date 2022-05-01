clear all
close all
clc
wamTree = importrobot("mirobot.urdf");
%% Parámetros de prueba

T = [ 1 0 0 0.1 ;
      0 1 0 0.1 ;
      0 0 1 0.6 ;
      0 0 0   1 ];

phi = 0;

elbowConfig = 'O';

toolOffset = 0.15;
plotGC = 0;
plotElbowGC = 0;
plotTransforms = 0;

%% Ejecución MCI

[thRad, phiOut] = mci_wam(T,phi,elbowConfig,toolOffset,plotGC,plotElbowGC,plotTransforms)

figure; show(wamTree,th);

%% Prueba: posiciones límite de la cámara

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

phi = -pi/2;

%%
for i = 1:8
    % Pose objetivo:
    T = baseTpivot*PoseCamaraSimulador(rho(i),beta(i),alfa(i))*camTtcp;
    % Solucion MCI
    [thRad, phiOut] = mci_wam(T,phi,elbowConfig,toolOffset,plotGC,plotElbowGC,plotTransforms)
    figure; show(wamTree,th);
end





