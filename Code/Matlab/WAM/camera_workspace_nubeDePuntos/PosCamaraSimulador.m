function pos = PosCamaraSimulador(rho,beta,alpha)
%Input en metros y en grados

T = eye(4);
% plot3(T(1,4),T(2,4),T(3,4),'k*');
% hold on;

% Rotacion ejes fijos en X de 10 grados
T = rotX(alpha*pi/180)*T;
% plot3(T(1,4),T(2,4),T(3,4),'g*');
% Rotacion eje movil Z de 40 grados
T = T*rotZ(beta*pi/180);
% plot3(T(1,4),T(2,4),T(3,4),'b*');
% Desplazamiento ejes moviles de 15 cm en y
T = T*desp([0 rho 0]);
% plot3(T(1,4),T(2,4),T(3,4),'r*');

pos = T(1:3,4);

end

