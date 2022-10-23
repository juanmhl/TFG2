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
         
for alpha = 30:5:80
    for beta = -30:5:30
        for rho = 0.14:0.02:0.22
            % Calculo de pose objetivo
            robotTobjetivo = robotTfulcro*PoseCamaraSimulador(rho,beta,alpha)*camTtcp;
%             thRad = mci_wam_antiguo(robotTobjetivo,'O',0.11,0,0,0);
            thRad = mci_wam(robotTobjetivo,'O',0.11,0,0,0,0.4);
            
            % Pose objetivo tras ejecutar mci (la que se envia de verdad)
            robotTobjetivo_tras_mci = MCD_WAM(thRad);
            
            T = inv(robotTfulcro)*robotTobjetivo_tras_mci*inv(camTtcp)*rotZ(pi/2);
            % Calculo de parametros alcanzados
            alpha_tras_mci = rad2deg(atan2(-T(2,3),T(3,3)));
            beta_tras_mci = rad2deg(atan2(-T(1,2),T(1,1)));
            rho_tras_mci = norm(T(1:3,4));
            
            error_rho = [error_rho, rho-rho_tras_mci];
            error_alpha = [error_alpha, alpha-alpha_tras_mci];
            error_beta = [error_beta, beta-beta_tras_mci];
        end
    end
end

figure; plot(error_rho);        title('Error de \rho');      xlabel('Muestras'); ylabel('e_{\rho} [m]');
% figure; plot(error_alpha);      title('Error de \alpha');    xlabel('Muestras'); ylabel('e_{\alpha} [º]');
% figure; plot(error_beta);       title('Error de \beta');     xlabel('Muestras'); ylabel('e_{\beta} [º]');