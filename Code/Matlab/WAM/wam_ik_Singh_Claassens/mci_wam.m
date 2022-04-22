function [th, thDeg, A, phiMin, phiMax, error] = mci_wam(T,phi,elbowConfig,toolOffset,plotGC,plotElbowGC)
%mci_wam This function provides the analytical solution for the Barrett WAM
%inverse kinematics problem given the target pose T, the parameter phi for
%the generating circle, and the elbow configuration, 'O' or 'I' ('out' or 
%'in') and 
%   INPUTS:
%   - T:    target pose, 4x4 hom trasf matrix
%   - phi:  generating circle angle parameter
%   - elbowConfiguration: 'out' / 'in'
%   - toolOffset: eso
%   OUTPUT:
%   - thDeg: vector with the solution for the ik problem for each
%     articulation in degrees, between -180º and 180
%   - th: solution formatted for 3D visualization with urdf model
%   - A: position of the elbow with relative to the base
%   - error:
%       - 0: todo bien
%       - 1: falla restriccion th2
%       - 2: falla restriccion th4
%       - 3: falla restriccion th6
%       - 4: falla restriccion alpha 2

%     addpath('C:\Users\juanm\Desktop\TFG\Code\Matlab\EstudioPosicionWAM\transformadas\');

    %% Definición parámetros DH1 Barrett WAM

    error = 0;
    phiMin = 0;
    phiMax = 0;
    
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

    ToolLength = d7 + toolOffset;
    
    
    %% Desired Tool and Wrist Position

    DTpos = T(1:3,4);
    TRz = T(1:3,3);
    
    DWpos = DTpos - ToolLength*TRz;
    
    d = norm(DWpos);

    if ( (0.2721 > d) || (d > 0.8582) )
        warning('No se cumple la restricción de th4, d fuera de rango');
        error = 1;
    end
    
    % Ploteo base, posición de la herramienta, y posición de la muñeca
%     figure;
%     plot3(0,0,0,'*k');
%     grid on
%     hold on
%     plot3(DTpos(1),DTpos(2),DTpos(3),'*b')
%     plot3(DWpos(1),DWpos(2),DWpos(3),'*r')
    
    %% For rotational norm matrix:
    % Rnorm -> matrix which places the desired wrist location to an eqvlnt
    % normal position
    
    xNorm = DWpos(1);
    yNorm = DWpos(2);
    zNorm = DWpos(3);
    
    LNorm = norm([xNorm yNorm]);
    
    if LNorm == 0 
        alphaNorm = 0;
        betaNorm = 0;
    else
%         alphaNorm = atan2(LNorm/d,zNorm/d);
        alphaNorm = acos(zNorm/d);
        betaNorm  = atan2(xNorm/LNorm,yNorm/LNorm);
    end
    
    Tnorm = rotX(alphaNorm)*rotZ(betaNorm);
    Rnorm = Tnorm(1:3,1:3);
    
    % Solo coincide la última fila, que es la que coincide con las
    % proyecciones del eje z móvil sobre los ejes fijos. El resto del ejes
    % no se especifican y no nos importan de momento.
    
    %% Calcs for definig circles UJC, GC, LJC
    
    L1 = norm([d3 a3]);
    L2 = norm([d5 a4]);
    
    %       METER COMPROBACIÓN DE QQUE LO DE DENTRO DEL SENO ES MENOR QUE 1 EN
    %       LA FUNCIÓN !!!!!!!!!!!!!
    
    if ( (d^2+L2^2-L1^2)/(2*d*L2) > 1 )
        warning('No hay solución para alfa 2');
        error = 4;
    end

    alph2 = acos((d^2+L2^2-L1^2)/(2*d*L2));
    alph1 = asin(L2*sin(alph2)/L1);
    
    dc = L1*cos(alph1);
%     dc = d - L2*cos(alph2);
    Rc = L1*sin(alph1);
%     Rc = L2*sin(alph2);
    % Debe salir lo mismo con ambos (y sale)
    
    LBAUj = pi/2 - atan(a3/d3);
    LOALj = pi/2 - atan(norm(a4)/d5);
    
    if (elbowConfig == 'O')
        thU = pi - (pi/2 - alph2) - LBAUj;
        thL = pi - (pi/2 - alph1) - LOALj;
        dcUJ = dc + sin(thU)*norm(a4);
        dcLJ = dc - sin(thL)*norm(a3);
        RcUJ = Rc + cos(thU)*norm(a4);
        RcLJ = Rc + cos(thL)*norm(a3);
    
    elseif (elbowConfig == 'I')
        thU = LBAUj - (pi/2 - alph2);
        thL = LOALj - (pi/2 - alph1);
        dcUJ = dc - sin(thU)*norm(a4);
        dcLJ = dc + sin(thL)*norm(a3);
        RcUJ = Rc - cos(thU)*norm(a4);
        RcLJ = Rc - cos(thL)*norm(a3);
    end
    
    %% Obtención de posición del codo sea fijo phi
    
    xW = DWpos(1);
    yW = DWpos(2);
    zW = DWpos(3);
    
    UJ = Cnorm(RcUJ,dcUJ,phi)'*Rnorm;
    xUJ = UJ(1);
    yUJ = UJ(2);
    zUJ = UJ(3);
    
    A = Cnorm(Rc,dc,phi)'*Rnorm;
    xA = A(1);
    yA = A(2);
    zA = A(3);
    
    LJ = Cnorm(RcLJ,dcLJ,phi)'*Rnorm;
    xLJ = LJ(1);
    yLJ = LJ(2);
    zLJ = LJ(3);

    UJVWP = (UJ'-DWpos)/d5;
    th2U = 2;
    if ( dot(UJVWP,TRz) < cos(th2U) )
        warning('No se cumple restricción para th6')
        error = 3;
    end

%     % RESTRICCIÓN DE PHI PARA th6 :
%     syms phi
%     UJsim = Cnorm(RcUJ,dcUJ,phi)'*Rnorm;
%     UJVWP = (UJsim'-DWpos)/d5;
%     th2U = 2;
%     phiMin6 = real(solve(dot(UJVWP,TRz)==cos(th2U),phi,'ReturnConditions',true))

    % Ploteo de círculos generadores en otra figura
    if plotGC
        plotGeneratingCircles(DTpos,DWpos,Rc,dc,RcUJ,dcUJ,RcLJ,dcLJ,Rnorm);
    end
    if plotElbowGC
        plotElbow(DTpos,DWpos,xA,yA,zA,xUJ,yUJ,zUJ,xLJ,yLJ,zLJ,dc,Tnorm,alphaNorm,betaNorm);
    end

    
    th1 = atan2(yLJ,xLJ);
    th2 = acos(zLJ/d3);
    
    LJVA = -(LJ-A)/a3;
    
    x = LJVA(1);
    y = LJVA(2);
    z = LJVA(3);
    
    s1 = sin(th1);
    c1 = cos(th1);
    s2 = sin(th2);
    c2 = cos(th2);

    limite = 5e-2;
    
    if norm(c2) > limite
        c3 = (x*c1+s1*y)/c2;
        s3 = (c1*c2*y-s1*c2*x)/c2;
    elseif norm(s1*s2) > limite
        c3 = (s1*z)/(-s1*s2);
        s3 = (c1*c2*z+s2*x)/(-s1*s2);
    elseif norm(c1*s2) > limite
        c3 = (-c1*z)/(c1*s2);
        s3 = (s1*c2*z+s2*y)/(c1*s2);
    end
    
    th3 = atan2(s3,c3);
    
    if elbowConfig == 'O'
        th4 = thU+thL;
    elseif elbowConfig == 'I'
        th4 = -(thU+thL);
    end
    
    H04 = transform(a1,alpha1,d1,th1) * transform(a2,alpha2,d2,th2) * ...
          transform(a3,alpha3,d3,th3) * transform(a4,alpha4,d4,th4);
    R04 = H04(1:3,1:3);
    
    Ptool = R04' * (DTpos-DWpos);
    
    xtool = Ptool(1);
    ytool = Ptool(2);
    ztool = Ptool(3);
    
    if elbowConfig == 'O'
        th5 = atan2(ytool,xtool) + pi;
        th6 = atan2(ztool,sqrt(xtool^2+ytool^2)) - pi/2;
    elseif elbowConfig == 'I'
        th5 = atan2(ytool,xtool);
        th6 = pi/2 - atan2(ztool,sqrt(xtool^2+ytool^2));
    end
    
    th7 = 0;
    
    thDeg = rad2deg(wrapToPi([th1 th2 th3 th4 th5 th6 th7]));

    %% Solución acondicionada al modelo 3D
    th(1).JointName = 'wam/base_yaw_joint';
    th(2).JointName = 'wam/shoulder_pitch_joint';
    th(3).JointName = 'wam/shoulder_yaw_joint';
    th(4).JointName = 'wam/elbow_pitch_joint';
    th(5).JointName = 'wam/wrist_yaw_joint';
    th(6).JointName = 'wam/wrist_pitch_joint';
    th(7).JointName = 'wam/palm_yaw_joint';
    
    th(1).JointPosition = wrapToPi(th1);
    th(2).JointPosition = wrapToPi(th2);
    th(3).JointPosition = wrapToPi(th3);
    th(4).JointPosition = wrapToPi(th4);
    th(5).JointPosition = wrapToPi(th5);
    th(6).JointPosition = wrapToPi(th6);
    th(7).JointPosition = wrapToPi(th7);

end



% %% Para sacar la posicion del codo busco la posicion del sistema 3
% disp("Matriz T03 con cinemática directa")
% T01 = transform(a1,alpha1,d1,th1);
% T12 = transform(a2,alpha2,d2,th2);
% T23 = transform(a3,alpha3,d3,th3);
% T03 = T01*T12*T23;


%% Funciones

function p = Cnorm(R,D,phi)

    p = [R*cos(phi) R*sin(phi) D]';

end

function T =  transform(a,alpha,d,th)

    T = [cos(th) -sin(th)*cos(alpha) sin(th)*sin(alpha) a*cos(th);
         sin(th) cos(th)*cos(alpha) -cos(th)*sin(alpha) a*sin(th);
         0 sin(alpha) cos(alpha) d;
         0 0 0 1];

end

function plotGeneratingCircles(DTpos,DWpos,Rc,dc,RcUJ,dcUJ,RcLJ,dcLJ,Rnorm)
    figure;
    plot3(0,0,0,'*k');
    grid on
    hold on
    for phi = -3.1:0.1:3.1
        A = Cnorm(Rc,dc,phi)'*Rnorm;
        xA = A(1);
        yA = A(2);
        zA = A(3);
        plot3(xA,yA,zA,'.k')
        UJ = Cnorm(RcUJ,dcUJ,phi)'*Rnorm;
        xUJ = UJ(1);
        yUJ = UJ(2);
        zUJ = UJ(3);
        plot3(xUJ,yUJ,zUJ,'.g')
        LJ = Cnorm(RcLJ,dcLJ,phi)'*Rnorm;
        xLJ = LJ(1);
        yLJ = LJ(2);
        zLJ = LJ(3);
        plot3(xLJ,yLJ,zLJ,'.b')
    end
    plot3(DTpos(1),DTpos(2),DTpos(3),'*b');
    plot3(DWpos(1),DWpos(2),DWpos(3),'*r');
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
end

function plotElbow(DTpos,DWpos,xA,yA,zA,xUJ,yUJ,zUJ,xLJ,yLJ,zLJ,dc,Tnorm,alphaNorm,betaNorm)
    figure;
    plot3(0,0,0,'*k');
    grid on
    hold on
    plot3(DTpos(1),DTpos(2),DTpos(3),'*b')
    plot3(DWpos(1),DWpos(2),DWpos(3),'*r')
    plot3(xA,yA,zA,'.k');
    plot3(xUJ,yUJ,zUJ,'.g');
    plot3(xLJ,yLJ,zLJ,'.b');
    xlabel('X');
    ylabel('Y');
    zlabel('Z');    

    % Ploteo base
    TB = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    FB=createFRAME(TB,'r','B',0.15);

    % Ploteo círculo en Z
    TGC = [1 0 0 0; 0 1 0 0; 0 0 1 dc; 0 0 0 1];
    FGC = createFRAME(TGC,'b','GC',0.15);

    % Ploteo círculo rotado
    TGCr = rotZ(-betaNorm)*rotX(-alphaNorm)*TGC;
    FGC = createFRAME(TGCr,'b','GCr',1);

end