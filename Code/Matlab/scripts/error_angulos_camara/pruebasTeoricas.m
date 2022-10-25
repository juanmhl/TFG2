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
         
error_rho = [];
error_alpha = [];
error_beta = [];
error_estudiado = [];
error_posicion = [];

wamTree = importrobot("mirobot.urdf");
         
for alpha = 30:5:80
    for beta = -30:5:30
        for rho = 0.14:0.02:0.22
            % Calculo de pose objetivo
            robotTobjetivo = robotTfulcro*PoseCamaraSimulador(rho,beta,alpha)*camTtcp;
            [thRad, error_estudiado_ahora, phiOut, th, A, UJ, LJ] = mci_wam_antiguo(robotTobjetivo,'O',0.11,0,0,0);
%             thRad = mci_wam(robotTobjetivo,'O',0.11,0,0,0,0.4);
            
            % Visualizacion
%             figure; show(wamTree,th);
%             hold on;
%             transform = getTransform(wamTree,th,'wam/shoulder_yaw_link');
%             F=createFRAME(transform,'b','Base',0.35);
%             UJ(3) = UJ(3)+transform(3,4);
%             UJF = createFRAME([eye(3), UJ'; 0 0 0 1],'b','UJ',0.3)
%             A = desp([0 0 transform(3,4)])*[A'; 1];
%             plot3(0,0,0,'r*');
%             plot3(A(1),A(2),A(3),'b*');
%             plot3(A(1),A(2),A(3),'b*');
            
            % Pose objetivo tras ejecutar mci (la que se envia de verdad)
            robotTobjetivo_tras_mci = MCD_WAM(thRad);
            
            T = inv(robotTfulcro)*robotTobjetivo_tras_mci*inv(camTtcp)*rotZ(pi/2);
            % Calculo de parametros alcanzados
            alpha_tras_mci = rad2deg(atan2(-T(2,3),T(3,3)));
            beta_tras_mci = rad2deg(atan2(-T(1,2),T(1,1)));
            rho_tras_mci = norm(T(1:3,4));

            error_posicion_ahora = norm(robotTobjetivo(1:3,4)-robotTobjetivo_tras_mci(1:3,4));
            
            error_rho = [error_rho, rho-rho_tras_mci];
            error_alpha = [error_alpha, alpha-alpha_tras_mci];
            error_beta = [error_beta, beta-beta_tras_mci];
            error_estudiado = [error_estudiado, error_estudiado_ahora];
            error_posicion = [error_posicion, error_posicion_ahora];
        end
    end
end

% figure; plot(error_posicion); ylabel("Error de posición (m)"); xlabel('Muestras');
figure; plot(error_estudiado); xlabel('Muestras');
% figure; plot(error_rho);        title('Error de \rho');      xlabel('Muestras'); ylabel('e_{\rho} [m]');
% figure; plot(error_alpha);      title('Error de \alpha');    xlabel('Muestras'); ylabel('e_{\alpha} [º]');
% figure; plot(error_beta);       title('Error de \beta');     xlabel('Muestras'); ylabel('e_{\beta} [º]');