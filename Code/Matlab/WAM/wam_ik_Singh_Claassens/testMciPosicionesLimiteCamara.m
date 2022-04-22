
clear all
close all

toolOffset = 10e-2;

phi = -3*pi/4;

camTtcp = [ -1 0  0 0;
             0 1  0 0;
             0 0 -1 0;
             0 0  0 1
          ];

baseTpivot = [ -1  0 0  0.5;
                0 -1 0  0;
                0  0 1 -0.15;
                0  0 0  1
             ];

alfa = [15 15 15 15 80 80 80 80];
rho = [0.14 0.14 0.22 0.22 0.14 0.14 0.22 0.22];
beta = [30 -30 30 -30 30 -30 30 -30];

thDegSol = zeros([8,7]);

wamTree = importrobot("mirobot.urdf");

% figure;

for i = 1:8
    T = baseTpivot*PoseCamaraSimulador(rho(i),beta(i),alfa(i))*camTtcp;
    [th, thDeg, A] = mci_wam(T,phi,'O',toolOffset,0,0);
%     plot3(T(1,4),T(2,4),T(3,4),'*');
%     hold on
    thDegSol(i,:) = thDeg;
    figure; show(wamTree,th);
end


% No parece funcionar bien para índices 5 y 6 (tcp mucho más arriba de lo
% que debería, y codo abajo, no arriba)