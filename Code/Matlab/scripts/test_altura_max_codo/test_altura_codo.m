clear all
close all
clc

%% Parámetros de prueba

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

elbowConfig = 'O';
toolOffset = 0.11;
plotGC = 0;
plotElbowGC = 0;
plotTransforms = 0;

% H = .25;
H_min = 0.2;
H_max = 0.3;

errores = [];
num_errores = [];

limiteHorizontal = 30;
limiteVerticalBajo = 15;
limiteVerticalAlto = 80;
limiteLargoBajo = 0.14;
limiteLargoAlto = 0.22;

% H = 0.2
% for largo = limiteLargoBajo:0.02:limiteLargoAlto
%     for alpha = limiteVerticalBajo:10:limiteVerticalAlto
%         for beta = -limiteHorizontal:10:limiteHorizontal
%             T = robotTfulcro*PoseCamaraSimulador(largo,beta,alpha)*camTtcp;
%             [thRad, ~, ~, ~, ~, error] = mci_wam(T,elbowConfig,toolOffset,plotGC,plotElbowGC,plotTransforms,H);
%             errores = [errores, error];
%         end
%     end
% end
% num_errores = sum(errores==15)

for H = H_min:0.01:H_max
    errores = [];
    for largo = limiteLargoBajo:0.02:limiteLargoAlto
        for alpha = limiteVerticalBajo:10:limiteVerticalAlto
            for beta = -limiteHorizontal:10:limiteHorizontal
                T = robotTfulcro*PoseCamaraSimulador(largo,beta,alpha)*camTtcp;
                [thRad, ~, ~, ~, ~, error] = mci_wam(T,elbowConfig,toolOffset,plotGC,plotElbowGC,plotTransforms,H);
                errores = [errores, error];
            end
        end
    end
    num_errores = [num_errores; H sum(errores==15)]
end

num_errores
