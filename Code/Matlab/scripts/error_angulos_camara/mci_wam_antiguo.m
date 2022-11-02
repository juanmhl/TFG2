% function [thRad, errorEstudiado, phiOut, th, A, UJ, LJ, thDeg, error] = mci_wam_antiguo(T,elbowConfig,toolOffset,plotGC,plotElbowGC,plotTransforms,phiIn)
function [thRad, errorEstudiado, phiOut, th, A, UJ, LJ, thDeg, error] = mci_wam_antiguo(T,elbowConfig,toolOffset,plotGC,plotElbowGC,plotTransforms,grados)
%mci_wam This function provides the analytical solution for the Barrett WAM
%inverse kinematics problem given the target pose T and: 
%   INPUTS:
%   - T:    target pose, 4x4 hom trasf matrix
%   - elbowConfiguration: 'out' / 'in'
%   - toolOffset: length of tool offset in meters
%   - plotGC: true if you want to plot generating circles for pose T
%   - plotGC: true if you want to plot elbow position for pose T
%   - plotGC: true if you want to plot transforms for pose T
%   - H: max hight from the robot base for the elbow point LJ in meters
%   OUTPUT:
%   - thRad: vector with the solution for the ik problem for each
%     articulation in rads, between -pi and pi
%   - phiOut: elbow angle in GC chosen by the function
%   - th: solution formatted for 3D visualization with urdf model
%   - thDeg: vector with the solution for the ik problem for each
%     articulation in degrees, between -180º and 180
%   - A: position of the elbow with relative to the base
%   - error:
%       - 0: ok
%       - 1: th2 restriction fails
%       - 2: th4 restriction fails
%       - 3: th6 restriction fails
%       - 4: alpha2 restriction fails

    error = 0;

    %% DH1 parameters Barrett WAM

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

    proyeccion = Rnorm*DWpos;
%     errorEstudiado = d - proyeccion(3);   % Insignificante
%     errorEstudiado = proyeccion(1);     % Insignificante
%     errorEstudiado = proyeccion(2);     % Insignificante
    
    %% Calcs for definig circles UJC, GC, LJC parameters
    
    L1 = (norm([d3 a3]));
    L2 = (norm([d5 a4]));
    
%     if ( (d^2+L2^2-L1^2)/(2*d*L2) > 1 )
%         warning('No hay solución para alfa 2');
%         error = 4;
%     end

    alph2 = acos((d^2+L2^2-L1^2)/(2*d*L2));
    alph1 = asin(L2*sin(alph2)/L1);
    
    dc = L1*cos(alph1);
%     dc = d - L2*cos(alph2);
    Rc = L1*sin(alph1);
%     Rc = L2*sin(alph2);
    
    LBAUj = ( pi/2 - atan2(a3,d3) );
    LOALj = ( pi/2 - atan2(norm(a4),d5) );
    
    if (elbowConfig == 'O')
        thU = pi - (pi/2 - alph2) - LBAUj + deg2rad(grados);
        thL = pi - (pi/2 - alph1) - LOALj + deg2rad(grados);
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

    %% Obtencion de valores limite de phi segun restricciones de th2
    r = [11*pi/10, 3*pi/2];
    th2lim = 2;
    A = double( RcLJ * Rnorm(1,3) );
    B = double( -(RcLJ * Rnorm(2,3)) );
    C = double( cos(th2lim)*d3 - dcLJ * Rnorm(3,3) );

    [rth2, errorth2] = resolver_inecuacion(A,B,C,0,1,r);

    %% Obtencion de valores limite de phi segun restricciones de th6
    th6lim = pi/2;
    A = double( RcUJ * (TRz(1)*Rnorm(1,1) + TRz(2)*Rnorm(1,2) + TRz(3)*Rnorm(1,3)) );
    B = double( - ( RcUJ * (TRz(1)*Rnorm(2,1) + TRz(2)*Rnorm(2,2) + TRz(3)*Rnorm(2,3)) ) );
    C = double( -TRz(1)*(dcUJ*Rnorm(3,1)-DWpos(1)) - TRz(2)*(dcUJ*Rnorm(3,2)-DWpos(2)) - TRz(3)*(dcUJ*Rnorm(3,3)-DWpos(3)) );

    [rth6, errorth6] = resolver_inecuacion(A,B,C,1,1,r);

    %% Obtencion de valores limites de phi generales
    r = [11*pi/10, 3*pi/2-0.3];

    [r, hayInterseccionth2] = calc_interseccion(r, rth2);
    [r, hayInterseccionth6] = calc_interseccion(r, rth6);

    hayInterseccion = hayInterseccionth6 && hayInterseccionth2;

    if hayInterseccion
%         phi = wrapToPi(max(r));
        phi = wrapTo2Pi(max(r));
    else
        phi = 0.3212;
        warning('No hay interseccion entre los rangos de las restricciones')
    end

    %% Obtencion de posicion del codo sea fijo phi

%     phi = phiIn;
    
    xW = DWpos(1);
    yW = DWpos(2);
    zW = DWpos(3);
    
    UJ = Cnorm(RcUJ,dcUJ,phi)'*Rnorm;
%     UJ = double( Cnorm(RcUJ,dcUJ,phi)' );
    xUJ = UJ(1);
    yUJ = UJ(2);
    zUJ = UJ(3);
    
    A = Cnorm(Rc,dc,phi)'*Rnorm;
%     A = double( Cnorm(Rc,dc,phi)' );
    xA = A(1);
    yA = A(2);
    zA = A(3);
    
    LJ = Cnorm(RcLJ,dcLJ,phi)'*Rnorm;
%     LJ = double( Cnorm(RcLJ,dcLJ,phi)' );
    xLJ = LJ(1);
    yLJ = LJ(2);
    zLJ = LJ(3);

    % Para la identificacion de la fuente de error
%     errorEstudiado = L1 - norm(A);  % Insignificante
%     errorEstudiado = L2 - norm(A'-DWpos);   % Insig
    errorEstudiado = d3 - norm(LJ);     % ERROR SIGNIFICATIVO DE 3MM !!!!!!
%     errorEstudiado = d5 - norm(UJ'-DWpos);  % ERROR SIGNIFICATIVO DE 3MM !!!!!!
%     errorEstudiado = d5 - norm(UJ'-[0 0 d]');  % ERROR SIGNIFICATIVO DE 3MM !!!!!!
%     errorEstudiado = alph1 - atan2(norm(cross(A',DWpos)),dot(A',DWpos));    % Insig
%     errorEstudiado = alph2 - atan2(norm(cross(DWpos,DWpos-A')),dot(DWpos,DWpos-A')); %Insignificante
%     errorEstudiado = LBAUj - atan2(norm(cross(A'-DWpos,A'-UJ')),dot(A'-DWpos,A'-UJ'));
%     errorEstudiado = LBAUj - atan2(norm(cross(A'-[0 0 d]',A'-UJ')),dot(A'-[0 0 d]',A'-UJ'));
%     errorEstudiado = LOALj - atan2(norm(cross(A',A'-LJ')),dot(A',A'-LJ'));
%     errorEstudiado = LBAUj;
%     errorEstudiado = LOALj;
%     errorEstudiado = rad2deg(thU);
%     errorEstudiado = dcUJ;
%     errorEstudiado = norm(a3) - norm(A'-LJ');   % Insignificante
%     errorEstudiado = norm(a4) - norm(A'-UJ');
%     errorEstudiado = pi/2 - atan2(norm(cross([0,0,0]'-LJ',A'-LJ')),dot([0,0,0]'-LJ',A'-LJ'));   % ERROR SIGNIFICATIVO    % 3º
%     errorEstudiado = pi/2 - atan2(norm(cross(DWpos-UJ',A'-UJ')),dot(DWpos-UJ',A'-UJ'));    % 3º
%     errorEstudiado = pi/2 - atan2(norm(cross([0 0 d]'-UJ',A'-UJ')),dot([0 0 d]'-UJ',A'-UJ'));

    UJVWP = (UJ'-DWpos)/d5;
%     UJVWP = (UJ'-DWpos)/norm(UJ'-DWpos);
    th2U = 2;

    % Ploteo de círculos generadores en otra figura
    if plotGC
        plotGeneratingCircles(DTpos,DWpos,Rc,dc,RcUJ,dcUJ,RcLJ,dcLJ,Rnorm);
    end
    % Ploteo de posicion del codo en otra figura
    if plotElbowGC
        plotElbow(DTpos,DWpos,xA,yA,zA,xUJ,yUJ,zUJ,xLJ,yLJ,zLJ,dc,Tnorm,alphaNorm,betaNorm);
    end

    %% Calculo de soluciones

    th1 = atan2(yLJ,xLJ);
%     th1 = atan2(yLJ,xLJ)+pi;
    th2 = acos(zLJ/d3);
%     th2 = -acos(zLJ/d3);
    
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
        th4 = double(thU+thL);
    elseif elbowConfig == 'I'
        th4 = -double(thU+thL);
    end
    
    H04 = transform(a1,alpha1,d1,th1) * transform(a2,alpha2,d2,th2) * ...
          transform(a3,alpha3,d3,th3) * transform(a4,alpha4,d4,th4);
%     errorEstudiado = norm(H04(1:3,4)-UJ'); % Distancia entre UJ calculada y UJ tras aplicar MCD
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

    H07 = H04 * transform(a5,alpha5,d5,th5) * transform(a6,alpha6,d6,th6) ...
              * transform(a7,alpha7,d7,th7);
    % Ploteo de transformadas antes de la rotacion final
    if plotTransforms
        figure;
        createFRAME(T,'b','DT');
        createFRAME(H07,'r','H07');
        title('rotacion original')
    end
    origen = H07(1:3,1);
    destino = T(1:3,1);

    th7 = -atan2(norm(cross(destino,origen)),dot(destino,origen)) + pi;

    H07 = H04 * transform(a5,alpha5,d5,th5) * transform(a6,alpha6,d6,th6) ...
              * transform(a7,alpha7,d7,th7);

    %% Obtencion de solucion final
    thRad = wrapToPi([th1 th2 th3 th4 th5 th6 th7]);

    load("limitesArticulaciones.mat");

    cambiarConfig = 0;

    % Comprueba si th5 cumple con los limites
    if ( (thRad(5)<limitesRAD(5,1)) || (thRad(5)>limitesRAD(5,2)) )
        display('5 no cumple, cambiando a configuracion 2')
        cambiarConfig = 1;
    end

    if cambiarConfig
        thRad = wrapToPi([th1 th2 th3 th4 th5+pi -th6 th7+pi]);
        warning('cambiando a configuracion de angulos 2')
    end

    th7 = 0;

    H07 = H04 * transform(a5,alpha5,d5,thRad(5)) * transform(a6,alpha6,d6,thRad(6)) ...
              * transform(a7,alpha7,d7,0);

    origen = H07(1:3,1);
    destino = T(1:3,1);

    % Habria que volver a calcular th7
    th7 = -atan2(norm(cross(destino,origen)),-dot(destino,origen)) + pi/2;

    destinoX = T(1:3,1);
    destinoY = T(1:3,2);
    origen = H07(1:3,2);
    sq7 = dot(destinoX, origen); % Vector orientación n: T(1:3,1)
    cq7 = dot(destinoY, origen); % Vector orientación s: T(1:3,2)
    q7 = atan2(sq7, cq7);
    th7 = q7+pi/2;
    
    % Ploteo de transfromadas en su posicion final
    if plotTransforms
        H07 = H04 * transform(a5,alpha5,d5,thRad(5)) * transform(a6,alpha6,d6,thRad(6)) ...
                  * transform(a7,alpha7,d7,th7);
        figure;
        createFRAME(T,'b','DT');
        createFRAME(H07,'r','H07');
        title('rotacion propuesta')
    end
    
    thRad(7) = wrapToPi(th7);

    % Comprobacion de limites para cada articulacion
    noCumple = 0;
    for i = 1:7
        if ( (thRad(i)<limitesRAD(i,1)) || (thRad(i)>limitesRAD(i,2)) )
            noCumple = 1;
            sprintf('no cumple la articulacion %d',i)
        end
    end

    if noCumple
        display('NO SE CUMPLEN LAS RESTRICCIONES DE ANGULO')
    else
        display('SI SE CUMPLEN LAS RESTRICCIONES DE ANGULO')
    end

    phiOut = phi;
    thDeg = rad2deg(thRad);

    %% Solucion formateada al modelo 3D
    th(1).JointName = 'wam/base_yaw_joint';
    th(2).JointName = 'wam/shoulder_pitch_joint';
    th(3).JointName = 'wam/shoulder_yaw_joint';
    th(4).JointName = 'wam/elbow_pitch_joint';
    th(5).JointName = 'wam/wrist_yaw_joint';
    th(6).JointName = 'wam/wrist_pitch_joint';
    th(7).JointName = 'wam/palm_yaw_joint';
    
    th(1).JointPosition = wrapToPi(thRad(1));
    th(2).JointPosition = wrapToPi(thRad(2));
    th(3).JointPosition = wrapToPi(thRad(3));
    th(4).JointPosition = wrapToPi(thRad(4));
    th(5).JointPosition = wrapToPi(thRad(5));
    th(6).JointPosition = wrapToPi(thRad(6));
    th(7).JointPosition = wrapToPi(thRad(7));

end


%% Funciones

function p = Cnorm(R,D,phi)
    % Posiciones dentro de circulos generadores
    p = [R*cos(phi) R*sin(phi) D]';
end

function T =  transform(a,alpha,d,th)
    % Transformada con parametros DH1
    T = [cos(th) -sin(th)*cos(alpha) sin(th)*sin(alpha) a*cos(th);
         sin(th) cos(th)*cos(alpha) -cos(th)*sin(alpha) a*sin(th);
         0 sin(alpha) cos(alpha) d;
         0 0 0 1];

end

% function [r, error] = resolver_inecuacion(A,B,C,invertir)
% 
%     ALPHA = atan2(B,A);
%     error = 0;
%     
%     % No hay solucion a la inecuacion si:
%     if ( norm(C/sqrt(A^2+B^2)) > 1 )
%         % Probamos si se cumple la inecuacion para un punto cualquiera
%         phi = -pi/2;
%         if ( A*cos(phi)-B*sin(phi) > C )    % Si cumple para todo angulo
%             r = [0, 2*pi];
%         else                                % No cumple para ningun angulo
%             r = [0, 0];
%             error = -1;     % Flag que señaliza que no hay solucion posible
%         end
%     
%     else 
%         % En caso de haber solucion se encuentran 2
%         s1 = wrapTo2Pi (acos(   C/sqrt(A^2+B^2)) - ALPHA );
%         s2 = wrapTo2Pi (-acos(C/sqrt(A^2+B^2)) - ALPHA );
%         sols = sort([s1, s2]);
%     
%         % Probamos con el valor del medio a ver si cumple
%         phi = mean(sols);
%         
%         if ~invertir
%             if ( (A*cos(phi)-B*sin(phi) > C) )    % Si cumple para ese angulo
%                 r = [sols(1), sols(2)];
%             else                                % No cumple para ese angulo
%                 r = [sols(2), sols(1)+2*pi];
%             end
%         elseif invertir
%             if ( (A*cos(phi)-B*sin(phi) < C) )    % Si cumple para ese angulo
%                 r = [sols(1), sols(2)];
%             else                                % No cumple para ese angulo
%                 r = [sols(2), sols(1)+2*pi];
%             end
%         end
%     
%     end
% 
% end

function [rout, hayInterseccion] = calc_interseccion(r1, r2)

min1enr2 = (r1(1) > r2(1)) && (r1(1) < r2(2));
max1enr2 = (r1(2) > r2(1)) && (r1(2) < r2(2));
min2enr1 = (r2(1) > r1(1)) && (r2(1) < r1(2));
max2enr1 = (r2(2) > r1(1)) && (r2(2) < r1(2));

hayInterseccion =  (min1enr2 || min2enr1 || max1enr2 || max2enr1);

if ~hayInterseccion
    rout = [0, 0];
elseif hayInterseccion
    rout = [max([r1(1),r2(1)]), min([r1(2),r2(2)])];
end

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
        if phi==-1.6
            A = Cnorm(Rc,dc,phi)'*Rnorm;
            xA = A(1);
            yA = A(2);
            zA = A(3);
            plot3(xA,yA,zA,'*r')
            UJ = Cnorm(RcUJ,dcUJ,phi)'*Rnorm;
            xUJ = UJ(1);
            yUJ = UJ(2);
            zUJ = UJ(3);
            plot3(xUJ,yUJ,zUJ,'*r')
            LJ = Cnorm(RcLJ,dcLJ,phi)'*Rnorm;
            xLJ = LJ(1);
            yLJ = LJ(2);
            zLJ = LJ(3);
            plot3(xLJ,yLJ,zLJ,'*r')
        end
    end
    plot3(DTpos(1),DTpos(2),DTpos(3),'*b');
    plot3(DWpos(1),DWpos(2),DWpos(3),'*g');
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