function thRad_tras_numIK = send_iksolution_to(T)

    global jointclient;
    global jointmsg;
%     global wamTree;
%     global ik;
%     global altura;
%     global gik;
%     global restriccionPose;
%     global limitJointChange;

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

%     ToolLength = d7 + toolOffset;

    longTool = 0.11;
    
    % MCI analitico
    [thRad, phiOut, semilla] = mci_wam(T,'O',longTool,0,0,0,0.4);

%     % MCI numerico
% %     weights = [0.25 0.25 0.25 1 1 1];
% %     [configSoln,solnInfo] = ik('wam/wrist_palm_stump_link',desp([0 0 altura])*T*desp([0 0 -longTool]),weights,semilla);
%     
%     restriccionPose.TargetTransform = desp([0 0 altura])*T*desp([0 0 -longTool]);
%     limitJointChange.Bounds(1,1) = thRad(1)-0.05;
%     limitJointChange.Bounds(1,2) = thRad(1)+0.05;
%     [configSoln,solnInfo] = gik(semilla,restriccionPose,limitJointChange);
% 
%     for i = 1:7
%         thRad_tras_numIK(i) = configSoln(i).JointPosition;
%     end
% 
%     % Comprueba si th5 cumple con los limites
%     load("limitesArticulaciones.mat");
%     cambiarConfig = 0;
%     if ( (thRad_tras_numIK(5)<limitesRAD(5,1)) || (thRad_tras_numIK(5)>limitesRAD(5,2)) )
%         display('5 no cumple tras mci_num, cambiando a configuracion 2')
%         cambiarConfig = 1;
%     end
% 
%     if cambiarConfig
%         thRad_tras_numIK = wrapToPi([thRad_tras_numIK(1) ...
%                                      thRad_tras_numIK(2) ...
%                                      thRad_tras_numIK(3) ...
%                                      thRad_tras_numIK(4) ...
%                                      thRad_tras_numIK(5)+pi ...
%                                      -thRad_tras_numIK(6) ...
%                                      thRad_tras_numIK(7)+pi ...
%                                      ]);
%         warning('cambiando a configuracion de angulos 2')
%     end
% 
%     th7 = 0;
%     H04 = transform(a1,alpha1,d1,thRad_tras_numIK(1)) * transform(a2,alpha2,d2,thRad_tras_numIK(2)) * ...
%           transform(a3,alpha3,d3,thRad_tras_numIK(3)) * transform(a4,alpha4,d4,thRad_tras_numIK(4));
%     H07 = H04 * transform(a5,alpha5,d5,thRad_tras_numIK(5)) * transform(a6,alpha6,d6,thRad_tras_numIK(6)) ...
%               * transform(a7,alpha7,d7,th7);
% 
%     origen = H07(1:3,1);
%     destino = T(1:3,1);
% 
%     % Habria que volver a calcular th7
% %     th7 = -atan2(norm(cross(destino,origen)),-dot(destino,origen)) + pi/2;
% 
%     destinoX = T(1:3,1);
%     destinoY = T(1:3,2);
%     origen = H07(1:3,2);
%     sq7 = dot(destinoX, origen); % Vector orientación n: T(1:3,1)
%     cq7 = dot(destinoY, origen); % Vector orientación s: T(1:3,2)
%     q7 = atan2(sq7, cq7);
%     th7 = q7+pi/2;
%     thRad_tras_numIK(7);
% 
% 
%     % Comprobacion de limites para cada articulacion
%     load("limitesArticulaciones.mat");
%     noCumple = 0;
%     for i = 1:7
%         if ( (thRad_tras_numIK(i)<limitesRAD(i,1)) || (thRad_tras_numIK(i)>limitesRAD(i,2)) )
%             noCumple = 1;
%             sprintf('no cumple la articulacion %d',i)
%         end
%     end
% 
%     if noCumple
%         display('NO SE CUMPLEN LAS RESTRICCIONES DE ANGULO TRAS MCI_NUM')
%     else
%         display('SI SE CUMPLEN LAS RESTRICCIONES DE ANGULO TRAS MCI_NUM')
%     end
        

%     figure; show(wamTree,th);

    jointmsg.Joints = thRad;

    call(jointclient,jointmsg);

end

function T =  transform(a,alpha,d,th)
    % Transformada con parametros DH1
    T = [cos(th) -sin(th)*cos(alpha) sin(th)*sin(alpha) a*cos(th);
         sin(th) cos(th)*cos(alpha) -cos(th)*sin(alpha) a*sin(th);
         0 sin(alpha) cos(alpha) d;
         0 0 0 1];

end