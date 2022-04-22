clear all
clc
close all
% addpath('C:\Users\juanm\Desktop\TFG\Code\Matlab\');
wamTree = importrobot("mirobot.urdf");
%% 

T = [ 1 0 0 0.1 ;
      0 1 0 0.1 ;
      0 0 1 0.6 ;
      0 0 0   1 ];

phi = 0;

elbowConfig = 'O';

toolOffset = 0;
plotGC = 0;
plotElbowGC = 0;
%% 

[th, thDeg, A, phiMin, phiMax, error] = mci_wam(T,phi,elbowConfig,toolOffset,plotGC,plotElbowGC);

figure; show(wamTree,th);

% for phi = -0.4:0.2:0.4
%     [th, thDeg, A] = mci_wam(T,phi,elbowConfig,toolOffset);
%     
% end




