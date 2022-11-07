clear all
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

% DH1 parameters Barrett WAM

a1 = 0;         
a2 = 0;         
a3 = 0.045;     
a4 = -0.045;    
a5 = 0;
a6 = 0;
a7 = 0;

alpha1 = -pi/2;
alpha2 = pi/2;
alpha3 = -pi/2;
alpha4 = pi/2;
alpha5 = -pi/2;
alpha6 = pi/2;
alpha7 = 0;

d1 = 0;
d2 = 0;
d3 = 0.55;
d4 = 0;
d5 = 0.3;
d6 = 0;
d7 = 0.06;

ToolLength = d7 + 0.11;
         
error_rho = [];
error_alpha = [];
error_beta = [];
error_estudiado = [];
error_posicion_tras_mci = [];
error_posicion_tras_numIK = [];
phis = [];
phiIns = [];
media_error_estudiado = [];

wamTree = importrobot("mirobot.urdf");
ik = inverseKinematics('RigidBodyTree',wamTree);
% weights = [0.1 0.1 0.1 1 1 1];
% weights = [0.05 0.05 0.05 1 1 1];
weights = [0.25 0.25 0.25 1 1 1];

gik = generalizedInverseKinematics('RigidBodyTree', wamTree, ...
    'ConstraintInputs', {'pose','joint'})

efectorFinal = 'wam/wrist_palm_stump_link';
restriccionPose = constraintPoseTarget(efectorFinal);
% restriccionPose.TargetTransform = desp([0 0 altura])*robotTobjetivo*desp([0 0 -0.11]);

codo = 'wam/wrist_yaw_link';
restriccionCodo = constraintCartesianBounds(codo);
% restriccionCodo.Bounds = [A(1)-0.2, A(1)+0.2; ...
%                           A(2)-0.2, A(2)+0.2; ...
%                           A(3)-0.2, A(3)+0.2  ...
%                          ];

limitJointChange = constraintJointBounds(wamTree);
% limitJointChange.Bounds = [thRad'-0.1, ...
%                            thRad'+0.1
%                           ];


%%
th(1).JointName = 'wam/base_yaw_joint';
th(2).JointName = 'wam/shoulder_pitch_joint';
th(3).JointName = 'wam/shoulder_yaw_joint';
th(4).JointName = 'wam/elbow_pitch_joint';
th(5).JointName = 'wam/wrist_yaw_joint';
th(6).JointName = 'wam/wrist_pitch_joint';
th(7).JointName = 'wam/palm_yaw_joint';

th(1).JointPosition = 0;
th(2).JointPosition = 0;
th(3).JointPosition = 0;
th(4).JointPosition = 0;
th(5).JointPosition = 0;
th(6).JointPosition = 0;
th(7).JointPosition = 0;
transform = getTransform(wamTree,th,'wam/shoulder_yaw_link');
altura = transform(3,4);
%%
% weights = [0.25 0.25 0.25 1 1 1];
% % ik.SolverParameters.GradientTolerance = 1e-7;
% ik.SolverParameters.SolutionTolerance = 1e-3;
%%


% for phiIn = -90:-10:-180
% % for phiIn = 180:10:270
% 
%     error_rho = [];
%     error_alpha = [];
%     error_beta = [];
%     error_estudiado = [];
%     error_posicion = [];
% 
%     phiIns = [phiIns, phiIn];
%     phiIn = deg2rad(phiIn);
% 
%     for alpha = 30:5:80
%         for beta = -30:5:30
%             for rho = 0.14:0.02:0.22
%                 % Calculo de pose objetivo
%                 robotTobjetivo = robotTfulcro*PoseCamaraSimulador(rho,beta,alpha)*camTtcp;
%                 [thRad, error_estudiado_ahora, phiOut, th, A, UJ, LJ] = mci_wam_antiguo(robotTobjetivo,'O',0.11,0,0,0,phiIn);
%     %             thRad = mci_wam(robotTobjetivo,'O',0.11,0,0,0,0.4);
%                 
%                 % Visualizacion
%     %             figure; show(wamTree,th);
%     %             hold on;
%     %             transform = getTransform(wamTree,th,'wam/shoulder_yaw_link');
%     %             F=createFRAME(transform,'b','Base',0.35);
%     %             UJ(3) = UJ(3)+transform(3,4);
%     %             UJF = createFRAME([eye(3), UJ'; 0 0 0 1],'b','UJ',0.3)
%     %             A = desp([0 0 transform(3,4)])*[A'; 1];
%     %             plot3(0,0,0,'r*');
%     %             plot3(A(1),A(2),A(3),'b*');
%     %             plot3(A(1),A(2),A(3),'b*');
%                 
% %                 % Pose objetivo tras ejecutar mci (la que se envia de verdad)
% %                 robotTobjetivo_tras_mci = MCD_WAM(thRad);
% %     
% %                 H03 = transfDH1(a1,alpha1,d1,thRad(1)) * ...
% %                       transfDH1(a2,alpha2,d2,thRad(2)) * ...
% %                       transfDH1(a3,alpha3,d3,thRad(3)); %* ...
% %     %                   transfDH1(a4,alpha4,d4,thRad(4));
%     
%     %             error_estudiado_ahora = norm(H03(1:3,4)-UJ');
%     %             error_estudiado_ahora = error_estudiado_ahora - norm(H04(1:3,4)-UJ');
%     
% %                 AVUJ = UJ'-A';
% %                 AVLJ = LJ'-A';
% %                 Vplano = cross(AVLJ,AVUJ);
% %                 Rz3 = H03(1:3,3);
% % %                 error_estudiado_ahora = rad2deg(atan2(norm(cross(Vplano,Rz3)),dot(Vplano,Rz3)));    % Angulo entre Z3, que sale del codo, y plano que contiene todo
%                 
% %                 T = inv(robotTfulcro)*robotTobjetivo_tras_mci*inv(camTtcp)*rotZ(pi/2);
% %                 % Calculo de parametros alcanzados
% %                 alpha_tras_mci = rad2deg(atan2(-T(2,3),T(3,3)));
% %                 beta_tras_mci = rad2deg(atan2(-T(1,2),T(1,1)));
% %                 rho_tras_mci = norm(T(1:3,4));
% %     
% %                 error_posicion_ahora = norm(robotTobjetivo(1:3,4)-robotTobjetivo_tras_mci(1:3,4));
%                 
% %                 error_rho = [error_rho, rho-rho_tras_mci];
% %                 error_alpha = [error_alpha, alpha-alpha_tras_mci];
% %                 error_beta = [error_beta, beta-beta_tras_mci];
%                 error_estudiado = [error_estudiado, error_estudiado_ahora];
% %                 error_posicion = [error_posicion, error_posicion_ahora];
%                 phis = [phis, rad2deg(phiOut)];
%             end
%         end
%     end
% %     figure; plot(rad2deg(error_estudiado));
% %     figure; plot(error_rho); xlabel('Muestras');
%     media_error_estudiado_ahora = rad2deg(mean(error_estudiado));
%     media_error_estudiado = [media_error_estudiado, media_error_estudiado_ahora];
% end

for alpha = 30:5:80
    for beta = -30:5:30
        for rho = 0.14:0.02:0.22
            % Calculo de pose objetivo
            robotTobjetivo = robotTfulcro*PoseCamaraSimulador(rho,beta,alpha)*camTtcp;
            [thRad, error_estudiado_ahora, phiOut, semilla, A, UJ, LJ] = mci_wam_antiguo(robotTobjetivo,'O',0.11,0,0,0);
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

%             [configSoln,solnInfo] = ik('wam/wrist_palm_stump_link',desp([0 0 altura])*robotTobjetivo*desp([0 0 -0.11]),weights,semilla);

            restriccionPose.TargetTransform = desp([0 0 altura])*robotTobjetivo*desp([0 0 -0.11]);
            limitJointChange.Bounds(1,1) = thRad(1)-0.05;
            limitJointChange.Bounds(1,2) = thRad(1)+0.05;

            [configSoln,solnInfo] = gik(semilla,restriccionPose,limitJointChange);
            for i = 1:7
                thRad_tras_numIK(i) = configSoln(i).JointPosition;
            end
            robotTobjetivo_tras_numIK =  MCD_WAM(thRad_tras_numIK);
            error_pos_tras_mci = norm(robotTobjetivo(1:3,4)-robotTobjetivo_tras_mci(1:3,4))
            error_pos_tras_solver = norm(robotTobjetivo(1:3,4)-robotTobjetivo_tras_numIK(1:3,4))
            error_posicion_tras_numIK = [error_posicion_tras_numIK, error_pos_tras_solver];

            H03 = transfDH1(a1,alpha1,d1,thRad_tras_numIK(1)) * ...
                  transfDH1(a2,alpha2,d2,thRad_tras_numIK(2)) * ...
                  transfDH1(a3,alpha3,d3,thRad_tras_numIK(3)); %* ...
%                   transfDH1(a4,alpha4,d4,thRad(4));

            error_estudiado_ahora = norm(H03(1:3,4)-A');
%             error_estudiado_ahora = error_estudiado_ahora - norm(H04(1:3,4)-UJ');

            AVUJ = UJ'-A';
            AVLJ = LJ'-A';
            Vplano = cross(AVLJ,AVUJ);
            Rz3 = H03(1:3,3);
%                 error_estudiado_ahora = rad2deg(atan2(norm(cross(Vplano,Rz3)),dot(Vplano,Rz3)));    % Angulo entre Z3, que sale del codo, y plano que contiene todo
            
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
            error_posicion_tras_mci = [error_posicion_tras_mci, error_posicion_ahora];
            phis = [phis, rad2deg(phiOut)];
        end
    end
end

% error_pos_medio = [];
% for grados = -10:1:10
% error_rho = [];
% error_alpha = [];
% error_beta = [];
% error_estudiado = [];
% error_posicion = [];
% phis = [];
% phiIns = [];
% media_error_estudiado = [];
% 
% for alpha = 30:5:80
%     for beta = -30:5:30
%         for rho = 0.14:0.02:0.22
%             % Calculo de pose objetivo
%             robotTobjetivo = robotTfulcro*PoseCamaraSimulador(rho,beta,alpha)*camTtcp;
%             [thRad, error_estudiado_ahora, phiOut, th, A, UJ, LJ] = mci_wam_antiguo(robotTobjetivo,'O',0.11,0,0,0,grados);
% %             thRad = mci_wam(robotTobjetivo,'O',0.11,0,0,0,0.4);
%             
%             % Visualizacion
% %             figure; show(wamTree,th);
% %             hold on;
% %             transform = getTransform(wamTree,th,'wam/shoulder_yaw_link');
% %             F=createFRAME(transform,'b','Base',0.35);
% %             UJ(3) = UJ(3)+transform(3,4);
% %             UJF = createFRAME([eye(3), UJ'; 0 0 0 1],'b','UJ',0.3)
% %             A = desp([0 0 transform(3,4)])*[A'; 1];
% %             plot3(0,0,0,'r*');
% %             plot3(A(1),A(2),A(3),'b*');
% %             plot3(A(1),A(2),A(3),'b*');
%             
%             % Pose objetivo tras ejecutar mci (la que se envia de verdad)
%             robotTobjetivo_tras_mci = MCD_WAM(thRad);
% 
%             H03 = transfDH1(a1,alpha1,d1,thRad(1)) * ...
%                   transfDH1(a2,alpha2,d2,thRad(2)) * ...
%                   transfDH1(a3,alpha3,d3,thRad(3)); %* ...
% %                   transfDH1(a4,alpha4,d4,thRad(4));
% 
% %             error_estudiado_ahora = norm(H03(1:3,4)-UJ');
% %             error_estudiado_ahora = error_estudiado_ahora - norm(H04(1:3,4)-UJ');
% 
%             AVUJ = UJ'-A';
%             AVLJ = LJ'-A';
%             Vplano = cross(AVLJ,AVUJ);
%             Rz3 = H03(1:3,3);
% %                 error_estudiado_ahora = rad2deg(atan2(norm(cross(Vplano,Rz3)),dot(Vplano,Rz3)));    % Angulo entre Z3, que sale del codo, y plano que contiene todo
%             
%             T = inv(robotTfulcro)*robotTobjetivo_tras_mci*inv(camTtcp)*rotZ(pi/2);
%             % Calculo de parametros alcanzados
%             alpha_tras_mci = rad2deg(atan2(-T(2,3),T(3,3)));
%             beta_tras_mci = rad2deg(atan2(-T(1,2),T(1,1)));
%             rho_tras_mci = norm(T(1:3,4));
% 
%             error_posicion_ahora = norm(robotTobjetivo(1:3,4)-robotTobjetivo_tras_mci(1:3,4));
%             
%             error_rho = [error_rho, rho-rho_tras_mci];
%             error_alpha = [error_alpha, alpha-alpha_tras_mci];
%             error_beta = [error_beta, beta-beta_tras_mci];
%             error_estudiado = [error_estudiado, error_estudiado_ahora];
%             error_posicion = [error_posicion, error_posicion_ahora];
%             phis = [phis, rad2deg(phiOut)];
%         end
%     end
% end
% 
% error_pos_medio = [error_pos_medio, mean(error_posicion)];
% 
% end
% 
% figure; plot([-10:1:10],error_pos_medio);


% figure; plot(error_posicion_tras_mci); ylabel("Error de posición tras mci (m)"); xlabel('Muestras');
% figure; plot(error_posicion_tras_numIK); ylabel("Error de posición tras numIK (m)"); xlabel('Muestras');

figure; plot((error_estudiado)); xlabel('Muestras');

% figure; plot(phis); title('Evolución temporal de \phi seleccionada por el algoritmo'); xlabel('Muestras'); ylabel('\phi (º)');
% figure; plot(error_rho);        title('Error de \rho');      xlabel('Muestras'); ylabel('e_{\rho} [m]');
% figure; plot(error_alpha);      title('Error de \alpha');    xlabel('Muestras'); ylabel('e_{\alpha} [º]');
% figure; plot(error_beta);       title('Error de \beta');     xlabel('Muestras'); ylabel('e_{\beta} [º]');

% figure; plot(phiIns,(media_error_estudiado)); title('Media del error estudiado para cada valor de \phi'); xlabel('\phi (º)'); ylabel('Media del error estudiado');

% %% Estimacion del tiempo de ejecucion de mci
% robotTobjetivo = robotTfulcro*PoseCamaraSimulador(0.18,0,25)*camTtcp;
% f = @() mci_wam_antiguo_simbolico(robotTobjetivo,'O',0.11,0,0,0);
% timeit(f)
