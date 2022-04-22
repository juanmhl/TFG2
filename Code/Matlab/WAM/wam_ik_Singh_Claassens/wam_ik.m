function th = wam_ik(T,phi,elbowConfig)
%DEPRECATED (no funciona) WAM_IK This function provides the analytical 
%solution for the Barrett WAM inverse kinematics problem given the target
%pose T, the parameter phi for the generating circle, and the elbow
%configuration, 'out' or 'in'.
%   INPUTS:
%   - T:    target pose, 4x4 hom trasf matrix
%   - phi:  generating circle angle parameter
%   - elbowConfiguration: 'out' / 'in'
%   OUTPUT:
%   - th: vector with the solution for the ik problem for each articulation

    addpath('..\funciones_matlab\');
    
    %% Definición parámetros DH1 Barrett WAM

    try
    
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
    
    ToolLength = d7;
    
    %% Desired Tool and Wrist Position
    
    DTpos = T(1:3,4);
    TRz = T(1:3,3);
    
    DWpos = DTpos - ToolLength*TRz;
    
    d = norm(DWpos);
    
    %% For rotational norm matrix:
    % Rnorm -> matrix which places the desired wrist location to an equivalent
    % normal position
    
    xNorm = DWpos(1);
    yNorm = DWpos(2);
    zNorm = DWpos(3);
    
    LNorm = norm([xNorm yNorm]);
    
    alphaNorm = atan2(LNorm/d,zNorm/d);
    betaNorm  = atan2(xNorm/LNorm,yNorm/LNorm);
    
    Tnorm = rotX(alphaNorm)*rotZ(betaNorm);
    Rnorm = Tnorm(1:3,1:3);
    
    % Solo coincide la última fila, que es la que coincide con las proyecciones
    % del eje z móvil sobre los ejes fijos. El resto de ejes no se especifican
    % y no nos importan
    
    %% Calcs for definig circles UJC, GC, LJC
    
    L1 = norm([d3 a3]);
    L2 = norm([d5 a4]);
    
    %       METER COMPROBACIÓN DE QQUE LO DE DENTRO DEL SENO ES MENOR QUE 1 EN
    %       LA FUNCIÓN !!!!!!!!!!!!!
    
    alph2 = acos((d^2+L2^2-L1^2)/(2*d*L2));
    alph1 = asin(L2*sin(alph2)/L1);
    
    dc = L1*cos(alph1);
%     dc = d - L2*cos(alph2);
    Rc = L1*sin(alph1);
%     Rc = L2*sin(alph2);
    % Estos salen clavados
    
    LBAUj = pi/2 - atan(a3/d3);
    LOALj = pi/2 - atan(norm(a4)/d5);
    
    if (elbowConfig == 'out')
        thU = pi - (pi/2 - alph2) - LBAUj;
        thL = pi - (pi/2 - alph1) - LOALj;
        dcUJ = dc + sin(thU)*norm(a4);
        dcLJ = dc - sin(thL)*norm(a3);
        RcUJ = Rc + cos(thU)*norm(a4);
        RcLJ = Rc + cos(thL)*norm(a3);
    
    elseif (elbowConfig == 'in')
        thU = LBAUj - (pi/2 - alph2);
        thL = LOALj - (pi/2 - alph1);
        dcUJ = dc - sin(thU)*norm(a4);
        dcLJ = dc + sin(thL)*norm(a3);
        RcUJ = Rc - cos(thU)*norm(a4);
        RcLJ = Rc - cos(thL)*norm(a3);
    end
    
    %% Obtención de valores para cada ángulo (ya si) sea fijo phi
    
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
    
    th1 = atan2(yLJ,xLJ);
    th2 = acos(xLJ/d3);
    
    LJVA = (LJ-A)/a3;
    
    x = LJVA(1);
    y = LJVA(2);
    z = LJVA(3);
    
    s1 = sin(th1);
    c1 = cos(th1);
    s2 = sin(th2);
    c2 = cos(th2);
    
    if norm(c2) > 1e-6
        c3 = (x*c1*x+s1*y)/c2;
        s3 = (c1*c2*y-s1*c2*x)/c2;
    elseif norm(s1*s2) > 1e-6
        c3 = (s1*y)/(-s1*s2);
        s3 = (c1*c2*y+s2*x)/(-s1*s2);
    elseif norm(c1*s2) > 1e-6
        c3 = (-c1*y)/(c1*s2);
        s3 = (s1*c2*y+s2*x)/(c1*s2);
    end
    
    th3 = atan2(s3,c3);
    
    if elbowConfig == 'out'
        th4 = thU+thL;
    elseif elbowConfig == 'in'
        th4 = -(thU+thL);
    end
    
    H04 = transform(a1,alpha1,d1,th1) * transform(a2,alpha2,d2,th2) * transform(a3,alpha3,d3,th3) * transform(a4,alpha4,d4,th4);
    R04 = H04(1:3,1:3);
    
    Ptool = R04' * (DTpos-DWpos);
    
    xtool = Ptool(1);
    ytool = Ptool(2);
    ztool = Ptool(3);
    
    if elbowConfig == 'out'
        th5 = atan2(ytool,xtool) + pi;
        th6 = atan2(ztool,sqrt(xtool^2+ytool^2)) - pi/2;
    elseif elbowConfig == 'in'
        th5 = atan2(ytool,xtool);
        th6 = pi/2 - atan2(ztool,sqrt(xtool^2+ytool^2));
    end

    th7 = 0;

%     th = [th1 th2 th3 th4 th5 th6];
    th(1).JointName = 'wam/base_yaw_joint';
    th(2).JointName = 'wam/shoulder_pitch_joint';
    th(3).JointName = 'wam/shoulder_yaw_joint';
    th(4).JointName = 'wam/elbow_pitch_joint';
    th(5).JointName = 'wam/wrist_yaw_joint';
    th(6).JointName = 'wam/wrist_pitch_joint';
    th(7).JointName = 'wam/palm_yaw_joint';

    th(1).JointPosition = th1;
    th(2).JointPosition = th2;
    th(3).JointPosition = th3;
    th(4).JointPosition = th4;
    th(5).JointPosition = th5;
    th(6).JointPosition = th6;
    th(7).JointPosition = th7;

    catch
        warning('ha habido un error')
        th = [0 0 0 0 0 0];
    end

end



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