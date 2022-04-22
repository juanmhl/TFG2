clear all
clc
close all
addpath('C:\Users\juanm\Desktop\TFG\Code\Matlab\');
wamTree = importrobot("C:\Users\juanm\Desktop\TFG\Code\Matlab\EstudioPosicionWAM\modelo_ik\barrett_model\robots\mirobot.urdf");

T = [ 1 0 0 0.1 ;
      0 1 0 0.1 ;
      0 0 1 0.6 ;
      0 0 0   1 ];

phi = 0;

elbowConfig = 'O';

toolOffset = 0;
plotGC = 0;
plotElbowGC = 0;

[th, thDeg, A, phiMin, phiMax, error] = mci_wam(T,phi,elbowConfig,toolOffset,plotGC,plotElbowGC)

% for phi = -0.4:0.2:0.4
%     [th, thDeg, A] = mci_wam(T,phi,elbowConfig,toolOffset);
%     figure; show(wamTree,th);
% end




